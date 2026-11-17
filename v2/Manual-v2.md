# MANUAL DE CAMPO v2.0 — Sistema Núcleo + Skills + Dientes
# (Guardar junto a: 1-nucleo/, 2-worker/, kit/, plantillas/, LEDGER.md)

═══════════════════════════════════════════
## 0. LA CAJA DE HERRAMIENTAS (v2.0)
═══════════════════════════════════════════

Todo vive en este repo (copia fuera de los proyectos):

- `v2/1-nucleo/boot-card-master-v2.md`  ← system prompt para proyectos NUEVOS
- `v2/1-nucleo/master-nucleo-v2.md`     ← el contrato del master (~123 líneas, 1 mensaje)
- `v2/2-worker/boot-card-worker-v2.md`  ← system prompt para proyectos EXISTENTES
- `v2/2-worker/worker-v2.md`            ← el contrato del worker (~100 líneas, 1 mensaje)
- `v2/kit/skills/`                      ← las 12 skills (se copian al proyecto en F4)
- `v2/plantillas/`                      ← AGENTS, DECISIONS-ADR, SPEC, verificar.sh, pre-commit
- `v2/LEDGER.md`                        ← el registro de escapes del sistema (§12)
- ESTE manual                           ← tu chuleta

REGLA DE ORO (no cambió, se reforzó):
  La IA no es la memoria del proyecto. La IA trabaja SOBRE la memoria
  del proyecto (AGENTS.md + DECISIONS.md + SPEC.md + Git + verificar.sh
  + skills/). Los chats son desechables; el disco es eterno.

LO NUEVO DE v2.0 en una línea: el master pasó de 3.501 líneas pegadas a
~123 de núcleo + conocimiento en disco (12 skills) leído SOLO cuando la
tarea lo toca + verificación mecánica que define "done" (verificar.sh).

═══════════════════════════════════════════
## 1. EL FLUJO DE MENSAJES (plantillas día-1)
═══════════════════════════════════════════

El truco boot card sigue (system prompt corto + contrato por mensaje),
pero v2.0 es MÁS FÁCIL: el contrato completo cabe en UN mensaje.

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
   [RUTA ABSOLUTA a este repo]/v2/kit — lee skills/bootstrap-foundation/
   SKILL.md y confirma reglas de juego. Y la idea: quiero construir
   [X] para [uso personal/...] que [qué hace].

   NOTA v2: el EMPEZAR ya EXIGE la prueba de digestión (resumen de las
   reglas en 5 líneas) ANTES de trabajar. Si resume mal o no resume:
   corrígelo antes de continuar — recepción no es digestión.

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

═══════════════════════════════════════════
## 2. PROYECTO NUEVO — LO QUE HARÁ EL MASTER (F0-F6)
═══════════════════════════════════════════

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

QUÉ OBSERVAR (tu cuaderno de bootstrap — checklist de adherencia):
- [ ] ¿Resumió las 10 reglas correctamente al EMPEZAR? (digestión)
- [ ] ¿Preguntó poco y con propósito? ¿SPEC.md con ACs verificables?
- [ ] ¿Justificó el stack + una alternativa? ¿DECISIONS en formato ADR?
- [ ] ¿Copió las 12 skills? ¿AGENTS.md <150 líneas con triggers?
- [ ] ¿verificar.sh + hook INSTALADOS y VERDES (evidencia pegada)?
- [ ] ¿Reportes con comando + exit + resumen pegado (no "ya está")?
- [ ] ¿El TEST DE RELEVO pasó? (sin él, el bootstrap no está completo)

═══════════════════════════════════════════
## 3. PROTOCOLO DE TAREAS (cómo pedir trabajo)
═══════════════════════════════════════════

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

PLANTILLA DE BUG (typo del manual v1.1 corregido):
  Bug encontrado en [interfaz]: [qué pasa exactamente, con el mensaje
  de error literal]. Diagnostica de verdad (reproduce con datos reales,
  no asumas mi hipótesis: [tu sospecha]). Corrige y protege contra
  regresión con tests. Suite completa. Reporte breve.

═══════════════════════════════════════════
## 4. TU ROL: EL TOUR DE ACEPTACIÓN
═══════════════════════════════════════════

Los tests cubren dominio y API. TÚ cubres lo que solo un humano ve:
- ¿La ventana/página se abre y se ve BIEN?
- ¿Los botones hacen algo al PULSARLOS (no solo existir)?
- ¿Los diálogos cancelan de verdad (Cancelar/Esc/clic-fuera)?
- ¿Se ve bien en modo oscuro, con datos reales, tras recargar?
- ¿Te resulta cómodo de USAR? (tú eres el usuario final)

REGLA: tras cada hito → tour de 5 minutos antes de aceptar.
Todo bug va con la plantilla de §3. Y si el bug coló por debajo de
todos los checks → entrada al LEDGER (§12): es un escape del sistema.

═══════════════════════════════════════════
## 5. ROTACIÓN POR HITOS (cuándo cambiar de chat)
═══════════════════════════════════════════

v2.0 rota por HITOS, no por cansancio: 1 feature o 1 bug = 1 chat.
El estado vive en disco; un chat fresco arranca de AGENTS.md + el
handoff de 10 líneas que el worker dejó al cerrar.

SEÑALES DE DECAIMIENTO (rotar YA, no empujar):
- 🟡 Confunde detalles ya establecidos, repite trabajo hecho
- 🟡 Sus ediciones fallan seguido (batches que no encajan)
- 🟡 Corrupción de archivos ("undefined" literales, imports comidos)
- 🔴 Errores raros, tests verdes falsos, mezcla versiones viejas

La rotación NO pierde NADA: AGENTS.md + verificar.sh + handoff de 10
líneas orientan al próximo agente solo. (Probado en el piloto v1.)

═══════════════════════════════════════════
## 6. IDENTIDAD GIT Y PROTECCIÓN DE MAIN (desde el día 1)
═══════════════════════════════════════════

IDENTIDAD GIT — ANTES del primer commit de todo proyecto:
  git config user.name  "tu-usuario"
  git config user.email "tu-email+id@users.noreply.github.com"
  Tras el primer commit del agente, verifica SIEMPRE:
  git log -1 --format='autor: %an <%ae> | committer: %cn <%ce>'
  → LECCIÓN DEL PILOTO (saga de autoría): las apps de IA pueden
  inyectar coautoría (Co-authored-by) o pisar la firma. Si aparece:
  enmienda antes del push (commit --amend) o reescribe mensajes
  (git filter-branch --msg-filter). Verificar git log -1 tras CADA
  commit del agente cuesta 2 segundos y cierra el agujero.

PROTECCIÓN DE MAIN — práctica estándar de todo proyecto con remoto:
  En GitHub: Settings → Branches → Add rule → main:
  - Require a pull request before merging
  - (opcional) Require approvals: 1 — para repos en equipo
  Esto mata el merge de un clic del banner "Compare & pull request".
  → LECCIÓN LEDGER entrada 1: un merge prematuro desde la web coló
  una rama a medias en main sin que nada lo impidiera. La protección
  de rama es el diente de GitHub; actívala el día que el repo existe.

RAMAS Y COMMITS — convención de este repo (y de todo proyecto v2):
  Ramas neutras nombradas por el trabajo: limpieza/ · fix/ · docs/ ·
  feature/... — NUNCA el nombre de la app herramienta que asista.
  Mensajes de commit que describen la OBRA, no el agente que la hizo.
  → POR QUÉ: el repo pertenece a su sistema, no a la herramienta del
  día; el rastro de nombres de apps en la historia ensucia el registro
  y responde «con qué» donde debe responder «qué y por qué».
  (Lección viva: una rama con nombre de herramienta, cazada y renombrada
  antes de su primer push en este mismo repo.)
  Excepción declarada: old/ conserva sus menciones históricas —
  documentan la época real que parió las boot cards. Historia no se edita.

═══════════════════════════════════════════
## 7. MANTENIMIENTO, RESPALDOS Y TAGS (política REAL)
═══════════════════════════════════════════

TRAS CADA HITO GRANDE:
1. Tour de aceptación (§4)
2. Export de datos si el proyecto los genera (FUERA del repo: los
   datos personales jamás van a Git)
3. Push + tag (ver política abajo)

POLÍTICA DE TAGS (la práctica real del piloto, no la promesa vieja):
- bugfix suelto → vX.Y.Z+1 (sin tour, sin ceremonia)
- hito con tour de aceptación → vX.(Y+1).0
- El tag se pone DESPUÉS del push que lo origina:
  git push && git tag vX.Y.Z && git push --tags
- Los tags marcan "aquí estuvo estable y aceptado" — por eso solo
  en hitos con tour pasado.

SUBIR A GITHUB (primera vez): gh repo create NOMBRE --source=. --push
ANTES DE PUBLICAR: git ls-files | grep -i '\.db\|\.sqlite\|\.env'
→ debe dar NADA. Y activa protección de main (§6).

═══════════════════════════════════════════
## 8. verificar.sh: LOS DIENTES (ya vienen del bootstrap)
═══════════════════════════════════════════

En v2.0 NO hay que pedirlo: F3 del bootstrap lo instala OBLIGATORIAMENTE
(verificar.sh + hook pre-commit) desde las plantillas del kit.

- ./scripts/verificar.sh --fast  → cada edición (sintaxis + corrupción)
- ./scripts/verificar.sh --full  → antes de cada commit (suite con
  pycache purgado + sync versiones + staleness + doctor de memoria)
- El hook pre-commit lanza --full solo; y si el diff toca al propio
  verificar.sh, exige confirmación humana explícita (VERIFY-OK): el
  agente no modifica a su juez en silencio.

PROYECTO LEGACY sin dientes: instalarlo es la PRIMERA tarea (copia las
plantillas del kit y adapta — añadir checks está permitido, quitarlos
no). POR QUÉ: el pycache obsoleto hizo pasar tests verdes con código
roto, y la corrupción de archivos pasó varias auditorías. Los dientes
convierten esas crisis invisibles en fallos visibles en segundos.

═══════════════════════════════════════════
## 9. EMERGENCIAS Y TRUCOS (los que sobrevivieron)
═══════════════════════════════════════════

- TIMEOUTS de instalación: tú ejecutas el comando en tu Terminal y le
  dices "hecho, sigue". La IA no espera; el humano no mecaniza.
- El agente se atasca → NO lo salves de inmediato: sus protocolos de
  recuperación necesitan oportunidad de trabajar.
- UI con bugs de renderizado → los tests de API NO los ven: tu tour es
  el único detector.
- Tarea abierta ("mejóralo") → buen examen: los buenos agentes eligen
  poco y descartan mucho CON RAZONES.
- Error "imposible" (disco ≠ lo escrito) → él debe re-verificar bytes
  antes de teorizar (está en su contrato, lección v2.3-v2.4 del piloto).
- Ante un conflicto entre tu petición y su contrato → él lo DECLARA y
  el contrato gana. Si te lo dice, no es rebelión: es el sistema.

═══════════════════════════════════════════
## 10. CHEAT SHEET (copiar y pegar)
═══════════════════════════════════════════

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

═══════════════════════════════════════════
## 11. LAS 10 REGLAS DURAS (el espíritu, sin cambios)
═══════════════════════════════════════════
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

═══════════════════════════════════════════
## 12. EL LEDGER DE ERRORES (el sistema vivo)
═══════════════════════════════════════════

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

SEMILLAS HISTÓRICAS (escapes del piloto que ya son dientes/checks):
- Corrupción "undefined" invisible a auditorías → barrido del --fast
- Tests verdes falsos por __pycache__ obsoleto → purga antes de suite
- Botones type=submit muertos en formularios → regla en code-quality
- Merge prematuro de main desde la web → LEDGER entrada 1 (protección
  de rama + ls-remote por fase)

Cuando un escape te ocurra a ti: primera reacción no es enfado, es
ENTRADA AL LEDGER. Cada escape cazado es un diente nuevo.
