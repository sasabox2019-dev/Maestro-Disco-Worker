# INFORME FINAL DE OBRA — Sistema v2.0 «Núcleo + Skills + Dientes»

Construcción v1.1 → v2.0 · Rama `v2.0` · Informe de cierre F6 (verificación final integral)
Fecha de cierre: 2026-11-17 (huso +0100) · Merge: PENDIENTE DE DECISIÓN DEL DUEÑO, por PR

---

## 1. Estructura final (árbol con líneas por archivo — `wc -l` de máquina)

```
old/                                    ← v1.1 intacta (ver §5.1)
v2/
  1-nucleo/
    boot-card-master-v2.md          20  (2.530 chars < 4000)
    master-nucleo-v2.md            123  (objetivo 150±20% = 120-180 ✓)
  2-worker/
    boot-card-worker-v2.md          20  (2.645 chars < 4000)
    worker-v2.md                   100  (objetivo 120±20% = 96-144 ✓)
  kit/skills/
    MAP.md                         485  (contrato de cobertura, 357 filas de norma)
    architecture-design/           100
    bootstrap-foundation/          191
    code-quality/                   64
    code-reviewer/                  65  (NUEVA)
    concurrency-reliability/        63
    debugging/                      68
    git-safety/                     84
    memory-maintenance/             78
    security/                       65
    spec-writing/                   77  (NUEVA)
    testing/                        68
    verification-reporting/        104
  plantillas/
    AGENTS.md                       68  (instancia <150)
    DECISIONS-ADR.md                23
    SPEC.md                         34
    pre-commit                      37  (exec 755)
    verificar.sh                   160  (exec 755)
  LEDGER.md                         19  (entrada 1 + mecanismo)
  Manual-v2.md                     307
─────────────────────────────────────────
total                            2.423 líneas de conocimiento v2.0
```

La compresión prometida, medida: 3.502 líneas de master pegadas SIEMPRE → 123 de núcleo
siempre + 1.027 de skills leídas SOLO cuando la tarea las dispara (~10% del coste por tarea típica).

## 2. Tabla de cobertura del mapa de mudanza (357 normas)

| Skill | Origen v1.1 | Normas | P | F | D | Notas |
|---|---|---|---|---|---|---|
| bootstrap-foundation | §§4-16 + §§79-107 | 125 | 123 | 2 | 0 | F: 11.1, 84.4 (fusionadas in-place) |
| spec-writing | NUEVA (SDD 2026) | — | — | — | — | auditada y aprobada externamente |
| verification-reporting | §§74-78 + §120 | 14 | 14 | 0 | 0 | + aporte v2: evidencia acotada |
| git-safety | §§13-14 + §§55-58 + §§63-64 | 25 | 22 | 3 | 0 | F→bf: §§13-14 lado fundación |
| testing | §§48-54 | 26 | 26 | 0 | 0 | 12 filas §§52-54 con doble ancla → debugging |
| architecture-design | §§17-33 | 39 | 38 | 1 | 0 | F: 24.1 (fusionada con 23.2-23.3) |
| code-quality | §37 + §§41-47 | 20 | 20 | 0 | 0 | + aporte v2: botón declara type (Ledger) |
| debugging | §§52-54 + §70 | 19 | 19 | 0 | 0 | + aportes v2: bytes impossibles, pycache |
| security | §§3.5-3.6 + §36 | 9 | 9 | 0 | 0 | checklist de superficie desplegada |
| concurrency-reliability | §§34-35 + §38 | 24 | 24 | 0 | 0 | barrido de casos límite completo |
| memory-maintenance | §§89-113 | 56 | 21 | 35 | 0 | F→bf: lado fundación (35 normas) |
| code-reviewer | NUEVA (Auditoría 1) | — | — | — | — | auditada y aprobada externamente |
| **TOTAL** | | **357** | **316** | **41** | **0** | **D=0: cero joyas descartadas** |

Cada fila es auditable en `v2/kit/skills/MAP.md` (sección origen + sección destino).
Las 41 F tienen destino declarado; las 12 de testing↔debugging llevan doble ancla.

## 3. Erratas propias acumuladas (12 — todas cazadas por el método o por auditoría, todas corregidas)

| # | Fase | Errata | Cazada por |
|---|---|---|---|
| 1 | F1 | Cabecera MAP declaraba 123 normas; real 125 (suma manual) | mi verificador |
| 2 | F1 | Commit de spec-writing decía «86 líneas» (77 real) — número de memoria | repro manual; desde entonces, conteo por máquina en el commit |
| 3 | F1 | `grep -c` sin coincidencias = exit 1 cortó la cadena `&&` | diagnóstico de eslabones |
| 4 | F1 | Patrón de filas a 2 segmentos cegaba IDs 3.5.x (security: 3/9) | el propio check del verificador |
| 5 | F1 | Cifras del tally con +1 newline vs `wc -l` (10 cifras) | re-medición por máquina |
| 6 | F2 | «six phases» sobrevivió en la boot card tras corregir el núcleo (propagación incompleta del off-by-one) | auditoría externa (H1) |
| 7 | F3 | Errata tipográfica «hard-to-reversible» introducida en edición | lectura de vuelta |
| 8 | F4 | `unittest discover -t .` no importable en Python 3.14 (suite rota de salida en la plantilla) | batería N4/V2 + repro anclada |
| 9 | F4 | El blindaje del pre-commit bloqueaba la PRIMERA instalación del verificador | batería C1; guarda `HEAD:` |
| 10 | F4 | Arnés `guarded()`: jobs en background reciben stdin /dev/null (falso fallo S2) | repro manual en verde |
| 11 | F4+F5 | `grep -E` con `\|` (sintaxis BRE) → ceros falsos en anclas — RECURRENTE en 2 tandas | re-grep con patrones limpios |
| 12 | F5 | LEDGER entrada 1 con placeholder «~09:0x» sin resolver | auditoría externa (H2) |

Lección transversal: la aritmética y los patrones se CALCULAN/PRUEBAN, nunca se leen de memoria.

## 4. Desviaciones del Plan Maestro (con justificación)

| # | Desviación | Justificación |
|---|---|---|
| 1 | 12 skills (la Síntesis decía «8-10») | resuelve el dueño al inicio: el prompt de misión manda |
| 2 | Núcleo 123 líneas vs «~150» | dentro de 150±20%; solo contenido de contrato, declarado |
| 3 | Worker 100 líneas vs «~120» | dentro de 120±20%; ídem |
| 4 | LEDGER como archivo propio (`v2/LEDGER.md`), no sección del Manual | dictado por el dueño tras el escape del merge prematuro; el Manual enlaza el mecanismo (§12) |
| 5 | Idioma: núcleo/worker/boots/skills en inglés | coherencia con v1.1 y portabilidad multi-app; Manual en español (doc del humano) |
| 6 | Off-by-one «6 fases» del Plan corregido: F0-F6 = 7 checkpoints | la aritmética manda sobre el documento; aceptado por el dueño |
| 7 | Plantillas de mensajes día-1 dentro del Manual (§1), no como archivos en 1-nucleo/2-worker | decisión F2 confirmada en F5: un solo lugar para el flujo del humano |
| 8 | MAP con una fila por norma (357) vs «tabla de cobertura» genérica | contrato auditable fila a fila — más fuerte que lo pedido |
| 9 | Cadencia --fast/--full condicionada a la existencia del verificador | auditoría externa (H3): proyectos legacy sin verificar.sh |

## 5. Evidencias de la verificación final (extractos acotados)

### 5.1 old/ intacta (diff byte a byte contra el tag v1.1-final)
```
$ git log --oneline -- old/ | wc -l   → 1  (solo la mudanza 420c409)
$ git diff --quiet v1.1-final:1/2master-bootstrap.md HEAD:old/1/2master-bootstrap.md
  (× 7 archivos)                       → IDENTICO × 7
```

### 5.2 Batería de skills (12 + MAP, completa)
```
$ node verificar-skill.mjs MAP.md <12 SKILL.md>  → exit 0
214 checks OK · 0 FAIL
TALLY GLOBAL: 12 bloques (2 NUEVAS) · 357 filas · P 316 · F 41 · D 0
VEREDICTO: TODO OK
```

### 5.3 Batería F4 re-ejecutada (plantillas en carpeta /tmp real, borrada, no commiteada)
```
$ bash bateria-f4.sh
L0 sh -n × 2 · V1 fast verde · V2 full verde (suite OK, sync 0.1.0, doctor OK)
N1 corrupción FAIL×razón · N2 drift FAIL×razón · N3 doctor FAIL nombrando ruta ·
N4 suite FAIL×razón + restaurado verde · C1 commit vía hook · N5 staleness WARN/
memoria-al-día · S1 aborta · S2 VERIFY-OK pasa + full verde · S3 respuesta mala aborta
==== BATERIA F4: PASS=24 FAIL=0 ====        → exit 0
$ ls /tmp/pvt.*                            → exit 1 (cero restos)
```

### 5.4 Conteos y Manual
```
nucleo 123 (120-180 ✓) · worker 100 (96-144 ✓) · boots 2.530/2.645 (<4000 ✓)
sh -n verificar.sh OK · sh -n pre-commit OK
Manual: paths citados 7/7 existen · typo v1.1 «Diagnica» ausente · «Diagnostica» ×1
```

## 6. Lo que NO se pudo verificar (declarado, no omitido)

1. **Adherencia empírica de los prompts en un agente real** — es el Proyecto Piloto #2
   (Fase 5 del plan de ejecución global): fuera del alcance de esta obra de construcción.
2. **Ramas pytest y npm de verificar.sh** — la batería ejercitó la rama unittest (el runner
   presente); pytest/npm están implementadas pero NO ejecutadas aquí.
3. **Rama JS del barrido de sintaxis** (node --check) — sin archivos JS en el proyecto de
   prueba; implementada, no ejercitada.
4. **Comportamiento del blindaje con /dev/tty real interactivo** — probado por pipe y
   por ausencia de tty (S1/S2/S3); la tty física se probará en el piloto.

## 7. Estado final de Git

```
rama v2.0: 21 commits (420c409 … a1c4cc7 + este informe) · tree limpio · push OK
main:      cc3de3f — INTACTA (v1.1 congelada; tag v1.1-final → cc3de3f verificado)
remoto:    main=cc3de3f · v2.0=a1c4cc7
```

## 8. Instrucción de merge (DECISIÓN Y EJECUCIÓN EXCLUSIVAS DEL DUEÑO)

1. Desde la web: `github.com/sasabox2019-dev/prompts/compare/main...v2.0` → «Create pull
   request». La descripción puede copiarse de este informe.
2. **AVISO de cuenta sola**: si la regla de main exige «1 approval», GitHub NO permite al
   dueño auto-aprobar su propio PR en una cuenta personal. Opciones: aprobar con la segunda
   cuenta (BilboDev), o bajar la regla a «Require PR» sin approvals (sigue matando el
   botón verde del banner).
3. Tras el merge (squash NO recomendado: los 21 commits son la historia de la obra):
   tag del hito → `git tag v2.0 && git push --tags`, y borrar la rama si se desea.

**ESTADO: LISTO PARA PR — esperando señal del dueño.**
