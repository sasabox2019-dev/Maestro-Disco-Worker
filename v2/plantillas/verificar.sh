#!/bin/sh
# verificar.sh v2 - layered mechanical verification.
# Usage: ./scripts/verificar.sh [--fast|--full]
#   --fast: syntax of the tree + corruption sweep (seconds)
#   --full: fast + test suite (caches purged) + version sync + staleness + memory doctor
# Env: VERIFICAR_STALE_N overrides the staleness window (default 5 commits).
#
# Bootstrap law: adapt to the stack by ADDING checks; never remove or weaken one.
# Boring bash on purpose: ASCII only in logic lines, no heredocs,
# every grep that can return zero matches ends in "|| true".

set -u

MODE="--fast"
[ $# -ge 1 ] && MODE="$1"
STALE_N="${VERIFICAR_STALE_N:-5}"
FAIL=0
WARN=0
MISSING="$(mktemp)"

fail() { printf 'FAIL  %s\n' "$1"; FAIL=$((FAIL+1)); }
warn() { printf 'WARN  %s\n' "$1"; WARN=$((WARN+1)); }
info() { printf 'OK    %s\n' "$1"; }

# ---------- layer 1: syntax of the tree ----------

CNT_PY=$(find . -type f -name '*.py' -not -path './.git/*' -not -path '*/node_modules/*' -not -path '*/venv/*' -not -path '*/.venv/*' 2>/dev/null | wc -l | tr -d ' ')
CNT_JS=$(find . -type f \( -name '*.js' -o -name '*.mjs' -o -name '*.cjs' \) -not -path './.git/*' -not -path '*/node_modules/*' 2>/dev/null | wc -l | tr -d ' ')

if [ "$CNT_PY" -gt 0 ]; then
  if command -v python3 >/dev/null 2>&1; then
    PY_TARGETS=""
    for d in src tests; do [ -d "$d" ] && PY_TARGETS="$PY_TARGETS $d"; done
    [ -z "$PY_TARGETS" ] && PY_TARGETS="."
    if python3 -m compileall -q $PY_TARGETS >/dev/null 2>&1; then
      info "python syntax ($CNT_PY files)"
    else
      fail "python syntax error (compileall)"
    fi
  else
    warn "python files present but no python3 available"
  fi
fi

if [ "$CNT_JS" -gt 0 ]; then
  if command -v node >/dev/null 2>&1; then
    JSBAD=0
    for f in $(find . -type f \( -name '*.js' -o -name '*.mjs' -o -name '*.cjs' \) -not -path './.git/*' -not -path '*/node_modules/*' 2>/dev/null); do
      if ! node --check "$f" >/dev/null 2>&1; then fail "node syntax: $f"; JSBAD=1; fi
    done
    [ "$JSBAD" -eq 0 ] && info "node syntax ($CNT_JS files)"
  else
    warn "js files present but no node available"
  fi
fi

SHBAD=0
for f in $(find . -type f -name '*.sh' -not -path './.git/*' 2>/dev/null); do
  if ! sh -n "$f" >/dev/null 2>&1; then fail "sh syntax: $f"; SHBAD=1; fi
done
[ "$SHBAD" -eq 0 ] && info "sh syntax"

# ---------- layer 2: corruption sweep ----------

# Markers that are never legitimate in these file types (historical escapes).
BAD=$(grep -rIn --exclude-dir=.git --exclude-dir=node_modules \
  --include='*.py' --include='*.sh' --include='*.md' --include='*.json' \
  --include='*.toml' --include='*.csv' --include='*.yml' --include='*.yaml' \
  -e 'undefined' -e '\[object Object\]' . 2>/dev/null | grep -v 'scripts/verificar.sh' | head -n 5 || true)
if [ -n "$BAD" ]; then
  printf '%s\n' "$BAD"
  fail "corruption markers in non-JS files: $(printf '%s\n' "$BAD" | wc -l | tr -d ' ')"
else
  info "corruption sweep (strict types) clean"
fi

# In JS-family files 'undefined' can be legitimate: list for review, do not fail.
JSMARK=$(grep -rIn --exclude-dir=.git --exclude-dir=node_modules \
  --include='*.js' --include='*.mjs' --include='*.cjs' --include='*.ts' \
  -e 'undefined' . 2>/dev/null | head -n 5 || true)
[ -n "$JSMARK" ] && { printf '%s\n' "$JSMARK"; warn "undefined in JS-family files: review the lines above"; }

[ "$MODE" = "--fast" ] && { printf -- '----\nverificar %s: FAIL=%d WARN=%d\n' "$MODE" "$FAIL" "$WARN"; [ "$FAIL" -gt 0 ] && exit 1; exit 0; }

# ---------- layer 3: test suite (caches purged) ----------

find . -name '__pycache__' -type d -exec rm -rf {} + >/dev/null 2>&1 || true
find . -name '.pytest_cache' -type d -exec rm -rf {} + >/dev/null 2>&1 || true

OUT="$(mktemp)"
if [ "$CNT_PY" -gt 0 ] && [ -d tests ]; then
  if command -v pytest >/dev/null 2>&1; then
    if pytest -q >"$OUT" 2>&1; then info "suite (pytest): $(tail -n 1 "$OUT")"; else printf '%s\n' "$(tail -n 5 "$OUT")"; fail "test suite (pytest)"; fi
  elif command -v python3 >/dev/null 2>&1; then
    if python3 -m unittest discover -s tests -q >"$OUT" 2>&1; then info "suite (unittest): $(tail -n 1 "$OUT" | tr -d '\r')"; else printf '%s\n' "$(tail -n 5 "$OUT")"; fail "test suite (unittest)"; fi
  else
    warn "python project but no test runner available"
  fi
elif [ -f package.json ] && grep -q '"test"' package.json 2>/dev/null; then
  if command -v npm >/dev/null 2>&1; then
    if npm test --silent >"$OUT" 2>&1; then info "suite (npm test): $(tail -n 1 "$OUT")"; else printf '%s\n' "$(tail -n 5 "$OUT")"; fail "test suite (npm)"; fi
  else
    warn "package.json with test script but no npm available"
  fi
else
  info "suite: none detected (adapt at bootstrap)"
fi

# ---------- layer 4: version sync ----------

PV=""
[ -f pyproject.toml ] && PV=$(grep -m1 -E '^version = ".*"' pyproject.toml 2>/dev/null | sed 's/version = "//; s/"$//' || true)
SV=""
[ -d src ] && SV=$(grep -rh -m1 '__version__ = ' src 2>/dev/null | head -n 1 | sed "s/.*__version__ *= *['\"]//; s/['\"].*//" || true)
if [ -n "$PV" ] && [ -n "$SV" ]; then
  if [ "$PV" = "$SV" ]; then info "version sync: $PV"; else fail "version drift: pyproject=$PV src=$SV"; fi
fi

# ---------- layer 5: staleness (src moved, memory did not) ----------

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  RECENT=$(git log --name-only --pretty=format: -n "$STALE_N" 2>/dev/null | sort -u | grep -v '^$' || true)
  if [ -z "$RECENT" ]; then
    info "staleness: no committed history yet"
  else
    SRCCH=$(printf '%s\n' "$RECENT" | grep -E '^(src|app|lib)/' | head -n 1 || true)
    MEMCH=$(printf '%s\n' "$RECENT" | grep -E '^(AGENTS\.md|DECISIONS\.md|README\.md|docs/)' | head -n 1 || true)
    if [ -n "$SRCCH" ] && [ -z "$MEMCH" ]; then
      warn "staleness: src changed in last $STALE_N commits without a memory update"
    else
      info "staleness: memory current (window $STALE_N)"
    fi
  fi
else
  info "staleness: not a git repo (skipped)"
fi

# ---------- layer 6: memory doctor (cited paths exist) ----------

if [ -f AGENTS.md ]; then
  : > "$MISSING"
  grep -o '`[^`]*`' AGENTS.md 2>/dev/null | tr -d '`' | while IFS= read -r t; do
    case "$t" in
      http*|*[!A-Za-z0-9._/-]*|*[' ']*|'') continue ;;
      */*) [ -e "$t" ] || printf '%s\n' "$t" >> "$MISSING" ;;
    esac
  done
  MISS_N=$(wc -l < "$MISSING" | tr -d ' ')
  if [ "$MISS_N" -gt 0 ]; then
    while IFS= read -r m; do fail "doctor: AGENTS.md cites missing path: $m"; done < "$MISSING"
  else
    info "doctor: all cited paths exist"
  fi
else
  info "doctor: no AGENTS.md (skipped)"
fi

printf -- '----\nverificar %s: FAIL=%d WARN=%d\n' "$MODE" "$FAIL" "$WARN"
[ "$FAIL" -gt 0 ] && exit 1
exit 0
