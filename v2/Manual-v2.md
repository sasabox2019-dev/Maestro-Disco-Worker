# FIELD MANUAL v2.0 — The "Nucleus + Skills + Teeth" System
# MANUAL DE CAMPO v2.0 — Sistema «Núcleo + Skills + Dientes»
# (Keep next to: 1-nucleo/, 2-worker/, kit/, plantillas/, LEDGER.md)

═══════════════════════════════════════════
# PART I — ENGLISH
═══════════════════════════════════════════

## 0. The Toolbox

Everything lives in this repository (keep your copy outside your projects):

- `v2/1-nucleo/boot-card-master-v2.md`  — system prompt for NEW projects
- `v2/1-nucleo/master-nucleo-v2.md`     — the master contract (~123 lines, one message)
- `v2/2-worker/boot-card-worker-v2.md`  — system prompt for EXISTING projects
- `v2/2-worker/worker-v2.md`            — the worker contract (~100 lines, one message)
- `v2/kit/skills/`                      — the 12 skills (copied into the project at F4)
- `v2/plantillas/`                      — AGENTS, DECISIONS-ADR, SPEC, verificar.sh, pre-commit
- `v2/LEDGER.md`                        — the error ledger (§12)
- THIS manual                           — your field reference

GOLDEN RULE (unchanged, reinforced):
  The AI is not the project's memory. The AI works ON the project's
  memory (AGENTS.md + DECISIONS.md + SPEC.md + Git + verificar.sh +
  skills/). Chats are disposable; disk is eternal.

The system in one line: a ~123-line nucleus always loaded + knowledge
on disk (12 skills) read ONLY when the task touches it + mechanical
verification that defines "done" (verificar.sh).

## 1. The Message Flow (day-one templates)

The boot-card trick still applies (short system prompt + contract by
message), but the whole contract now fits in ONE message.

### NEW PROJECT (master)

1. New chat in agent mode. Workspace: the new project folder.
2. System prompt: paste `v2/1-nucleo/boot-card-master-v2.md` in full.
3. Message 1:
   "I am about to send you your operating contract (Master Nucleus
   v2.0). Do not start any work yet: reply only 'recibido'."
4. Message 2: paste `v2/1-nucleo/master-nucleo-v2.md` in full (one message).
5. Message 3 (EMPEZAR — copy and adapt ONLY the bracketed parts):

   EMPEZAR. Contract adopted. Before the first task, restate the ten
   rules in five lines in your own words (digestion test — if you
   cannot summarize them, you have not adopted them).
   Then F0: the skills kit is at
   [absolute path to your copy of this repository]/v2/kit — read
   skills/bootstrap-foundation/SKILL.md and confirm the rules of
   engagement. And the idea: I want to build [X] for [personal
   use/...] that [what it does].

   NOTE: EMPEZAR REQUIRES the digestion test (five-line summary of the
   rules) BEFORE any work. If it summarizes badly or not at all:
   correct it before continuing — reception is not digestion.

### EXISTING PROJECT (worker — 95% of your life)

1. New chat, same project workspace.
2. System prompt: paste `v2/2-worker/boot-card-worker-v2.md`.
3. Message 1: "Worker v2.0 contract follows. Reply only 'recibido'
   until I say EMPEZAR."
4. Message 2: paste `v2/2-worker/worker-v2.md` (one message).
5. Message 3 (EMPEZAR + health check — copy):

   EMPEZAR. Contract adopted, confirm in one line. Then health check:
   read AGENTS.md and run ./scripts/verificar.sh --full if it exists.
   Report the state before any work.

   → Legacy project WITHOUT verificar.sh: installing it is the first
     task (§8). Without AGENTS.md: it is bootstrap-foundation
     territory — ask for a proper bootstrap instead of improvising.

## 2. New Project — What the Master Will Do (F0–F6)

The nucleus phases, translated into what YOU will see:

- F0 Kit: reads bootstrap-foundation from the kit. Checkpoint: states
  the rules of engagement from the skill, not from memory.
- F1 Discovery → SPEC.md: few purposeful questions; the SPEC with
  goal, non-goals and verifiable AC-1..N.
- F2 Stack → DECISIONS.md: chooses with justification; every decision
  with Estado/Contexto/Decisión/Alternativas/Consecuencias.
- F3 Foundation + TEETH: minimum scaffolding, Git, and MANDATORY:
  scripts/verificar.sh + pre-commit hook installed and GREEN. No
  longer a "recommendation": no teeth, no complete bootstrap.
- F4 Kit copy + AGENTS.md: the 12 skills into the project
  (portability: the project explains itself in any app/model) +
  AGENTS.md <150 lines with the trigger index.
- F5 First vertical slice against the SPEC: every AC verified by ID,
  evidence pasted.
- F6 Report + RELAY TEST (MANDATORY): a FRESH chat with only the
  worker boot card + worker + AGENTS.md completes a trivial task.
  The bootstrap does NOT end until the relay passes.

TYPICAL DISCOVERY ANSWERS (have them ready):
- Who for? → "Just me / personal use"
- Platform? → your choice
- Language/framework? → "No, you choose and briefly explain why"
- First useful version? → the MINIMUM, not the full dream
- Future features? → "Maybe, but do not complicate anything for that now"
- Plan confirmation? → "Go ahead" (only if it looks reasonable)

WHAT TO WATCH (your bootstrap adherence checklist):
- [ ] Did it restate the 10 rules correctly at EMPEZAR? (digestion)
- [ ] Few, purposeful questions? SPEC.md with verifiable ACs?
- [ ] Stack justified + one alternative? DECISIONS in ADR format?
- [ ] Did it copy the 12 skills? AGENTS.md <150 lines with triggers?
- [ ] verificar.sh + hook INSTALLED and GREEN (pasted evidence)?
- [ ] Reports with command + exit + summary pasted (not "done")?
- [ ] Did the RELAY TEST pass? (without it, the bootstrap is incomplete)

## 3. Task Protocol (how to order work)

- ONE task per message. Wait for report + commit before the next.
- Large tasks → "Before building, show me the proposal."
- When delegating → "you choose and explain why" — and do NOT re-decide.
- Reasonable confirmations → "Go ahead".
- If it would break a documented decision (ADR), IT must stop and ask
  you; you decide consciously. (It is in its contract.)

TASK TEMPLATE:
  New task: [WHAT, in human language]. It must allow [expected
  behavior]. [Reuse existing architecture if applicable]. [Proposal
  before building / go ahead with full autonomy]. Verification: tests
  + verificar.sh --full. Docs synchronized. Commit + report.

BUG TEMPLATE:
  Bug found in [interface]: [exactly what happens, with the literal
  error message]. Diagnose for real (reproduce with real data; do not
  assume my hypothesis: [your suspicion]). Fix and protect against
  regression with tests. Full suite. Brief report.

## 4. Your Role: The Acceptance Tour

Tests cover domain and API. YOU cover what only a human sees:
- Does the window/page open and look RIGHT?
- Do buttons DO something when clicked (not merely exist)?
- Do dialogs really cancel (Cancel/Esc/click-outside)?
- Does it look right in dark mode, with real data, after reload?
- Is it COMFORTABLE to use? (you are the end user)

RULE: after every milestone → a five-minute tour before accepting.
Every bug goes through the §3 template. And if a bug slipped past ALL
checks → an entry in the LEDGER (§12): it is a system escape.

## 5. Rotation by Milestones (when to change chats)

The system rotates by MILESTONES, not by fatigue: 1 feature or 1 bug
= 1 chat. State lives on disk; a fresh chat starts from AGENTS.md +
the 10-line handoff the worker left when closing.

DECAY SIGNALS (rotate NOW, do not push through):
- 🟡 Confuses already-settled details, repeats finished work
- 🟡 Its edits keep failing to land (batches that do not fit)
- 🟡 File corruption (literal "undefined", eaten imports)
- 🔴 Weird errors, false-green tests, mixed old versions

Rotation loses NOTHING: AGENTS.md + verificar.sh + the 10-line handoff
orient the next agent on their own. (Proven in real projects.)

## 6. Git Identity and Main Protection (from day one)

GIT IDENTITY — BEFORE the first commit of any project:
  git config user.name  "your-user"
  git config user.email "your-email+id@users.noreply.github.com"
  After the agent's first commit, ALWAYS verify:
  git log -1 --format='author: %an <%ae> | committer: %cn <%ce>'
  → REAL-WORLD LESSON (authorship incidents): AI apps can inject
  co-authorship (Co-authored-by) or override the signature. If it
  appears: amend before pushing (commit --amend) or rewrite messages
  (git filter-branch --msg-filter). Verifying git log -1 after EVERY
  agent commit takes 2 seconds and closes the hole.

MAIN PROTECTION — standard practice for any repository with a remote:
  On GitHub: Settings → Branches → Add rule → main:
  - Require a pull request before merging
  - (optional) Require approvals: 1 — for team repositories
  This kills the one-click merge of the "Compare & pull request"
  banner.
  → LEDGER LESSON: a premature merge from the web interface once
  slipped a half-built branch into main with nothing stopping it.
  Branch protection is GitHub's tooth; enable it the day the repo
  exists.

BRANCHES AND COMMITS — convention of this system (and every v2 project):
  Neutral branches named by the work: limpieza/ · fix/ · docs/ ·
  feature/... — NEVER the name of the assisting app.
  Commit messages describe the WORK, not the agent that made it.
  → WHY: the repository belongs to its system, not to the tool of
  the day; tool names in the history dirty the record and answer
  "with what" where it should answer "what and why".

## 7. Maintenance, Backups and Tags (real policy)

AFTER EVERY BIG MILESTONE:
1. Acceptance tour (§4)
2. Data export if the project generates data (OUTSIDE the repo:
   personal data never goes to Git)
3. Push + tag (policy below)

TAG POLICY (real-world practice, not the old promise):
- Loose bugfix → vX.Y.Z+1 (no tour, no ceremony)
- Milestone with acceptance tour → vX.(Y+1).0
- The tag goes AFTER the push that originated it:
  git push && git tag vX.Y.Z && git push --tags
- Tags mark "here it was stable and accepted" — hence only on
  milestones with a passed tour.

PUBLISHING TO GITHUB (first time): gh repo create NAME --source=. --push
BEFORE PUBLISHING: git ls-files | grep -i '\.db\|\.sqlite\|\.env'
→ must output NOTHING. And enable main protection (§6).

## 8. verificar.sh: The Teeth (they come with the bootstrap)

In this system you do not have to ask for them: bootstrap F3 installs
them MANDATORILY (verificar.sh + pre-commit hook) from the kit
templates.

- ./scripts/verificar.sh --fast  → after each edit (syntax + corruption)
- ./scripts/verificar.sh --full  → before every commit (suite with
  purged pycache + version sync + staleness + memory doctor)
- The pre-commit hook runs --full on its own; and if the diff touches
  verificar.sh itself, it demands explicit human confirmation
  (VERIFY-OK): the agent never modifies its own judge in silence.

LEGACY PROJECT without teeth: installing them is the FIRST task (copy
the kit templates and adapt — adding checks is allowed, removing them
is not). WHY: a stale pycache once made broken code pass tests, and
file corruption once slipped past several reviews. The teeth turn
those invisible crises into visible failures in seconds.

## 9. Emergencies and Tricks (the survivors)

- Installation TIMEOUTS: you run the command in your own Terminal and
  tell it "done, continue". The AI does not wait; the human does not
  grind.
- The agent gets stuck → do NOT rescue it immediately: its recovery
  protocols need room to work.
- UI rendering bugs → API tests do NOT see them: your tour is the
  only detector.
- Open-ended task ("improve it") → a good exam: good agents choose
  little and discard much WITH REASONS.
- "Impossible" error (disk ≠ what was written) → it must re-verify
  bytes before theorizing (it is in its contract — a lesson paid for
  in a real project).
- On a conflict between your request and its contract → it DECLARES
  it and the contract wins. If it tells you, it is not rebellion:
  it is the system working.

## 10. Cheat Sheet (copy and paste)

Delegate stack:    "No, you choose and briefly explain why."
Confirm plan:      "Go ahead with full autonomy."
Ask proposal:      "Before building, show me the proposal."
Ask commit:        "Commit with a message consistent with the
                    project's conventions."
Ask audit:         "Fresh chat + code-reviewer: review the diff
                    against SPEC/DECISIONS/AGENTS without the
                    author's reasoning."
Rotate chat:       (new chat + worker boot card + worker-v2.md +
                    EMPEZAR + health check of §1)
Tags reminder:     bugfix = vX.Y.Z+1 · milestone with tour = vX.(Y+1).0
Relay reminder:    bootstrap without relay test = incomplete bootstrap

## 11. The Ten Hard Rules (the spirit, unchanged)

1. User work is sacred (committed or not)
2. Never fabricate verification
3. Evidence before memory
4. Do not expand scope in silence
5. Protect data and secrets
6. Correctness over convenience
7. Investigate before deciding (high impact)
8. Every claim ≤ its evidence
9. User defines WHAT; repo defines WHAT EXISTS
10. Leave the project better, not merely different

## 12. The Error Ledger (the living system)

`v2/LEDGER.md` — and in every project, its own ledger if the project
produces escapes.

MECHANISM (what makes the system alive instead of frozen):
1. A bug slipped past ALL checks (tests, tour, verificar).
2. → Ledger entry: what slipped, what rule existed and did not stop
   it, date and context.
3. → The entry is CONVERTED: a new mechanical check in verificar.sh,
   or a new rule in the matching skill, or a mechanism (branch
   protection, template, protocol).
4. The conversion is declared in the entry itself.

SEEDS (escapes from real projects that are now teeth/checks):
- Invisible "undefined" corruption → the --fast sweep
- False-green tests from a stale __pycache__ → purge before the suite
- Dead type=submit buttons in forms → rule in code-quality
- Premature merge of main from the web → branch protection +
  per-phase ls-remote verification

When an escape happens to you: the first reaction is not anger, it is
A LEDGER ENTRY. Every caught escape is a new tooth.

═══════════════════════════════════════════
# PARTE II — ESPAÑOL
═══════════════════════════════════════════

## 0. La caja de herramientas

Todo vive en este repositorio (guarda tu copia fuera de los proyectos):

- `v2/1-nucleo/boot-card-master-v2.md`  ← system prompt para proyectos NUEVOS
- `v2/1-nucleo/master-nucleo-v2.md`     ← el contrato del master (~123 líneas, 1 mensaje)
- `v2/2-worker/boot-card-worker-v2.md`  ← system prompt para proyectos EXISTENTES
- `v2/2-worker/worker-v2.md`            ← el contrato del worker (~100 líneas, 1 mensaje)
- `v2/kit/skills/`                      ← las 12 skills (se copian al proyecto en F4)
- `v2/plantillas/`                      ← AGENTS, DECISIONS-ADR, SPEC, verificar.sh, pre-commit
- `v2/LEDGER.md`                        ← el ledger de errores (§12)
- ESTE manual                           ← tu referencia de campo

REGLA DE ORO (no cambió, se reforzó):
  La IA no es la memoria del proyecto. La IA trabaja SOBRE la memoria
  del proyecto (AGENTS.md + DECISIONS.md + SPEC.md + Git + verificar.sh
  + skills/). Los chats son desechables; el disco es eterno.

El sistema en una línea: un núcleo de ~123 líneas siempre cargado +
conocimiento en disco (12 skills) leído SOLO cuando la tarea lo toca +
verificación mecánica que define "done" (verificar.sh).

## 1. El flujo de mensajes (plantillas día-1)

El truco boot card sigue (system prompt corto + contrato por mensaje),
pero ahora el contrato completo cabe en UN mensaje.

### PROYECTO NUEVO (master)

1. Chat nuevo en modo agente. Workspace: la carpeta nueva del proyecto.
2. System prompt: pega `v2/1-nucleo/boot-card-master-v2.md` completo.
3. Mensaje 1:
   "Voy a enviarte tu contrato operativo (Master Núcleo v2.0). No
   empieces ningún trabajo todavía: responde únicamente 'recibido'."
4. Mensaje 2: pega `v2/1-nucleo/master-nucleo-v2.md` completo (1 mensaje).
5. Mensaje 3 (EMPEZAR — copiar y adaptar SOLO lo entre corchetes):

   EMPEZAR. Contrato adoptado. Antes de la primera tarea, reconfírmame
   las diez reglas en cinco líneas con tus palabras (prueba de
   digestión — si no las puedes resumir, no las has adoptado).
   Luego F0: el kit de skills está en
   [RUTA ABSOLUTA a tu copia de este repositorio]/v2/kit — lee
   skills/bootstrap-foundation/SKILL.md y confirma reglas de juego.
   Y la idea: quiero construir [X] para [uso personal/...] que [qué hace].

   NOTA: el EMPEZAR EXIGE la prueba de digestión (resumen de las reglas
   en 5 líneas) ANTES de trabajar. Si resume mal o no resume: corrígelo
   antes de continuar — recepción no es digestión.

### PROYECTO EXISTENTE (worker — el 95% de tu vida)

1. Chat nuevo, mismo workspace del proyecto.
2. System prompt: pega `v2/2-worker/boot-card-worker-v2.md`.
3. Mensaje 1: "Contrato worker v2.0 a continuación. Responde solo
   'recibido' hasta que diga EMPEZAR."
4. Mensaje 2: pega `v2/2-worker/worker-v2.md` (1 mensaje).
5. Mensaje 3 (EMPEZAR + chequeo de salud — copiar):

   EMPEZAR. Contrato adoptado, confírmalo en una línea. Luego chequeo
   de salud: lee AGENTS.md y ejecuta ./scripts/verificar.sh --full si
   existe. Reporta el estado antes de cualquier trabajo.

   → Proyecto legacy SIN verificar.sh: su instalación es la primera
     tarea (§8). Sin AGENTS.md: es terreno de bootstrap-foundation,
     pídele el arranque en vez de improvisar.

## 2. Proyecto nuevo — lo que hará el master (F0-F6)

Las fases del núcleo, traducidas a lo que VERÁS:

- F0 Kit: lee bootstrap-foundation del kit. Checkpoint: dice las reglas
  de juego desde la skill, no de memoria.
- F1 Discovery → SPEC.md: pocas preguntas con propósito; el SPEC con
  goal, non-goals y AC-1..N verificables.
- F2 Stack → DECISIONS.md: elige con justificación; cada decisión con
  Estado/Contexto/Decisión/Alternativas/Consecuencias.
- F3 Fundación + DIENTES: scaffolding mínimo, Git, y OBLIGATORIO:
  scripts/verificar.sh + hook pre-commit instalados y VERDES. Ya no es
  "recomendación del bootstrap": sin dientes no hay bootstrap completo.
- F4 Copia del kit + AGENTS.md: las 12 skills al proyecto (portabilidad:
  el proyecto se explica solo en cualquier app/modelo) + AGENTS.md <150
  líneas con el índice de triggers.
- F5 Primer slice vertical contra el SPEC: cada AC verificada por ID,
  evidencia pegada.
- F6 Reporte + TEST DE RELEVO (OBLIGATORIO): un chat FRESCO con solo
  boot card worker + worker + AGENTS.md completa una tarea trivial.
  El bootstrap NO termina hasta que el relevo pasa.

RESPUESTAS TÍPICAS DEL DISCOVERY (tenlas preparadas):
- ¿Para quién? → "Solo yo / uso personal"
- ¿Plataforma? → la que elijas
- ¿Lenguaje/framework? → "No, elige tú y explícame brevemente por qué"
- ¿Primera versión útil? → lo MÍNIMO, no el sueño completo
- ¿Futuras funciones? → "Quizá, pero no compliques nada por eso ahora"
- ¿Confirmación del plan? → "Adelante" (solo si te parece razonable)

QUÉ OBSERVAR (tu checklist de adherencia del bootstrap):
- [ ] ¿Resumió las 10 reglas correctamente al EMPEZAR? (digestión)
- [ ] ¿Preguntó poco y con propósito? ¿SPEC.md con ACs verificables?
- [ ] ¿Justificó el stack + una alternativa? ¿DECISIONS en formato ADR?
- [ ] ¿Copió las 12 skills? ¿AGENTS.md <150 líneas con triggers?
- [ ] ¿verificar.sh + hook INSTALADOS y VERDES (evidencia pegada)?
- [ ] ¿Reportes con comando + exit + resumen pegado (no "ya está")?
- [ ] ¿El TEST DE RELEVO pasó? (sin él, el bootstrap no está completo)

## 3. Protocolo de tareas (cómo pedir trabajo)

- UNA tarea por mensaje. Esperas reporte + commit antes de la siguiente.
- Tareas grandes → "Antes de construir, preséntame la propuesta."
- Al delegar: "elige tú y explícame por qué" — y NO re-decidir tú.
- Confirmaciones razonables → "Adelante".
- Si va a romper una decisión documentada (ADR), ÉL debe parar y
  consultarte; tú decides conscientemente. (Está en su contrato.)

PLANTILLA DE TAREA:
  Nueva tarea: [QUÉ, en lenguaje humano]. Debe permitir [comportamiento
  esperado]. [Reutiliza la arquitectura existente si aplica]. [Propuesta
  antes de construir / adelante con autonomía]. Verificación: tests +
  verificar.sh --full. Docs sincronizadas. Commit + reporte.

PLANTILLA DE BUG:
  Bug encontrado en [interfaz]: [qué pasa exactamente, con el mensaje
  de error literal]. Diagnostica de verdad (reproduce con datos reales,
  no asumas mi hipótesis: [tu sospecha]). Corrige y protege contra
  regresión con tests. Suite completa. Reporte breve.

## 4. Tu rol: el tour de aceptación

Los tests cubren dominio y API. TÚ cubres lo que solo un humano ve:
- ¿La ventana/página se abre y se ve BIEN?
- ¿Los botones hacen algo al PULSARLOS (no solo existir)?
- ¿Los diálogos cancelan de verdad (Cancelar/Esc/clic-fuera)?
- ¿Se ve bien en modo oscuro, con datos reales, tras recargar?
- ¿Te resulta cómodo de USAR? (tú eres el usuario final)

REGLA: tras cada hito → tour de 5 minutos antes de aceptar.
Todo bug va con la plantilla de §3. Y si el bug coló por debajo de
todos los checks → entrada al LEDGER (§12): es un escape del sistema.

## 5. Rotación por hitos (cuándo cambiar de chat)

El sistema rota por HITOS, no por cansancio: 1 feature o 1 bug = 1 chat.
El estado vive en disco; un chat fresco arranca de AGENTS.md + el
handoff de 10 líneas que el worker dejó al cerrar.

SEÑALES DE DECAIMIENTO (rotar YA, no empujar):
- 🟡 Confunde detalles ya establecidos, repite trabajo hecho
- 🟡 Sus ediciones fallan seguido (batches que no encajan)
- 🟡 Corrupción de archivos ("undefined" literales, imports comidos)
- 🔴 Errores raros, tests verdes falsos, mezcla versiones viejas

La rotación NO pierde NADA: AGENTS.md + verificar.sh + handoff de 10
líneas orientan al próximo agente solo. (Probado en proyectos reales.)

## 6. Identidad Git y protección de main (desde el día 1)

IDENTIDAD GIT — ANTES del primer commit de todo proyecto:
  git config user.name  "tu-usuario"
  git config user.email "tu-email+id@users.noreply.github.com"
  Tras el primer commit del agente, verifica SIEMPRE:
  git log -1 --format='autor: %an <%ae> | committer: %cn <%ce>'
  → LECCIÓN REAL (incidentes reales de autoría): las apps de IA pueden
  inyectar coautoría (Co-authored-by) o pisar la firma. Si aparece:
  enmienda antes del push (commit --amend) o reescribe mensajes
  (git filter-branch --msg-filter). Verificar git log -1 tras CADA
  commit del agente cuesta 2 segundos y cierra el agujero.

PROTECCIÓN DE MAIN — práctica estándar de todo repositorio con remoto:
  En GitHub: Settings → Branches → Add rule → main:
  - Require a pull request before merging
  - (opcional) Require approvals: 1 — para repos en equipo
  Esto mata el merge de un clic del banner "Compare & pull request".
  → LECCIÓN DEL LEDGER: un merge prematuro desde la web coló una vez
  una rama a medias en main sin que nada lo impidiera. La protección
  de rama es el diente de GitHub; actívala el día que el repo existe.

RAMAS Y COMMITS — convención de este sistema (y de todo proyecto v2):
  Ramas neutras nombradas por el trabajo: limpieza/ · fix/ · docs/ ·
  feature/... — NUNCA el nombre de la app herramienta que asista.
  Mensajes de commit que describen la OBRA, no el agente que la hizo.
  → POR QUÉ: el repositorio pertenece a su sistema, no a la
  herramienta del día; el rastro de nombres de apps en la historia
  ensucia el registro y responde «con qué» donde debe responder
  «qué y por qué».

## 7. Mantenimiento, respaldos y tags (política real)

TRAS CADA HITO GRANDE:
1. Tour de aceptación (§4)
2. Export de datos si el proyecto los genera (FUERA del repo: los
   datos personales jamás van a Git)
3. Push + tag (ver política abajo)

POLÍTICA DE TAGS (la práctica real de proyectos, no la promesa vieja):
- bugfix suelto → vX.Y.Z+1 (sin tour, sin ceremonia)
- hito con tour de aceptación → vX.(Y+1).0
- El tag se pone DESPUÉS del push que lo origina:
  git push && git tag vX.Y.Z && git push --tags
- Los tags marcan "aquí estuvo estable y aceptado" — por eso solo
  en hitos con tour pasado.

SUBIR A GITHUB (primera vez): gh repo create NOMBRE --source=. --push
ANTES DE PUBLICAR: git ls-files | grep -i '\.db\|\.sqlite\|\.env'
→ debe dar NADA. Y activa protección de main (§6).

## 8. verificar.sh: los dientes (ya vienen del bootstrap)

En este sistema NO hay que pedirlos: F3 del bootstrap los instala
OBLIGATORIAMENTE (verificar.sh + hook pre-commit) desde las plantillas
del kit.

- ./scripts/verificar.sh --fast  → cada edición (sintaxis + corrupción)
- ./scripts/verificar.sh --full  → antes de cada commit (suite con
  pycache purgado + sync versiones + staleness + doctor de memoria)
- El hook pre-commit lanza --full solo; y si el diff toca al propio
  verificar.sh, exige confirmación humana explícita (VERIFY-OK): el
  agente no modifica a su juez en silencio.

PROYECTO LEGACY sin dientes: instalarlos es la PRIMERA tarea (copia las
plantillas del kit y adapta — añadir checks está permitido, quitarlos
no). POR QUÉ: un pycache obsoleto hizo pasar tests verdes con código
roto, y la corrupción de archivos pasó varias revisiones. Los dientes
convierten esas crisis invisibles en fallos visibles en segundos.

## 9. Emergencias y trucos (los que sobrevivieron)

- TIMEOUTS de instalación: tú ejecutas el comando en tu Terminal y le
  dices "hecho, sigue". La IA no espera; el humano no mecaniza.
- El agente se atasca → NO lo salves de inmediato: sus protocolos de
  recuperación necesitan oportunidad de trabajar.
- UI con bugs de renderizado → los tests de API NO los ven: tu tour es
  el único detector.
- Tarea abierta ("mejóralo") → buen examen: los buenos agentes eligen
  poco y descartan mucho CON RAZONES.
- Error "imposible" (disco ≠ lo escrito) → él debe re-verificar bytes
  antes de teorizar (está en su contrato — lección pagada en un
  proyecto real).
- Ante un conflicto entre tu petición y su contrato → él lo DECLARA y
  el contrato gana. Si te lo dice, no es rebelión: es el sistema.

## 10. Cheat sheet (copiar y pegar)

Delegar stack:      "No, elige tú y explícame brevemente por qué."
Confirmar plan:     "Adelante con autonomía completa."
Pedir propuesta:    "Antes de construir, preséntame la propuesta."
Pedir commit:       "Haz el commit con mensaje coherente según las
                     convenciones del proyecto."
Pedir auditoría:    "Chat fresco + code-reviewer: revisa el diff contra
                     SPEC/DECISIONS/AGENTS sin conocer el razonamiento."
Rotar chat:         (chat nuevo + boot card worker + worker-v2.md +
                     EMPEZAR + chequeo de salud de §1)
Recordar tags:      bugfix = vX.Y.Z+1 · hito con tour = vX.(Y+1).0
Recordar relevo:    bootstrap sin test de relevo = bootstrap incompleto

## 11. Las 10 reglas duras (el espíritu, sin cambios)

1. El trabajo del usuario es sagrado (committed o no)
2. Nunca fabricar verificación
3. Evidencia antes que memoria
4. No expandir scope en silencio
5. Proteger datos y secretos
6. Corrección sobre conveniencia
7. Investigar antes de decidir (alto impacto)
8. Cada afirmación ≤ su evidencia
9. Usuario define QUÉ; repo define QUÉ EXISTE
10. Dejar el proyecto mejor, no solo distinto

## 12. El ledger de errores (el sistema vivo)

`v2/LEDGER.md` — y en cada proyecto, su propio ledger si el proyecto
genera escapes.

MECANISMO (lo que hace al sistema vivo en vez de congelado):
1. Un bug coló por debajo de TODOS los checks (tests, tour, verificar).
2. → Entrada al ledger: qué coló, qué regla existía y no lo paró,
   fecha y contexto.
3. → La entrada se CONVIERTE: check mecánico nuevo en verificar.sh, o
   regla nueva en la skill que corresponda, o mecanismo (protección de
   rama, plantilla, protocolo).
4. La conversión se declara en la propia entrada.

SEMILLAS (escapes de proyectos reales que ya son dientes/checks):
- Corrupción "undefined" invisible a revisiones → barrido del --fast
- Tests verdes falsos por __pycache__ obsoleto → purga antes de suite
- Botones type=submit muertos en formularios → regla en code-quality
- Merge prematuro de main desde la web → protección de rama +
  verificación ls-remote por fase

Cuando un escape te ocurra a ti: primera reacción no es enfado, es
ENTRADA AL LEDGER. Cada escape cazado es un diente nuevo.
