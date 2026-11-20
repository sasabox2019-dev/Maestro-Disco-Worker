# Maestro-Disco-Worker

**A complete operating system for building software with AI agents — from any chat app with file access.**

Master → Disk → Worker: a bootstrap master turns an idea into a self-documenting repository, a continuation worker keeps it growing, and mechanical verification decides what "done" means.

> **The AI is not the project's memory. The AI works ON the project's memory.**

Conversations are disposable. The repository — SPEC, decisions, AGENTS.md, skills, tests, verifier — is the project. Any agent, any app, any model can pick it up and continue it.

## Quick Start (5 minutes)

Requirements: any chat app with an agent mode and file access (read/write + commands).

1. **Get the toolkit:** clone or download this repository.
2. **New project:** create an empty folder for your project and open a fresh agent chat with that folder as its workspace.
3. **System prompt:** paste the contents of [`v2/1-nucleo/boot-card-master-v2.md`](v2/1-nucleo/boot-card-master-v2.md).
4. **One message:** paste the contents of [`v2/1-nucleo/master-nucleo-v2.md`](v2/1-nucleo/master-nucleo-v2.md) — the whole contract fits in a single message.
5. **Start:** send `EMPEZAR` with your idea ("I want to build X that does Y"). The exact start message and flow templates are in the Manual (§ The Message Flow).

The master runs phases **F0–F6** — discovery → SPEC → decisions → foundation + mechanical verification → skills + AGENTS.md → first vertical slice → **relay test** — and leaves behind a project that any fresh chat can continue without the original conversation.

**Continuing an existing project** (the other 95% of your life): system prompt = [`v2/2-worker/boot-card-worker-v2.md`](v2/2-worker/boot-card-worker-v2.md), then [`v2/2-worker/worker-v2.md`](v2/2-worker/worker-v2.md) in one message, then EMPEZAR + a health check. Details in the Manual.

## What's here

| Path | What it is |
|---|---|
| `v2/1-nucleo/` | Master boot card + nucleus — the bootstrap contract (~123 lines) |
| `v2/2-worker/` | Worker boot card + contract — continuation sessions (~100 lines) |
| `v2/kit/skills/` | The 12 Agent Skills (bootstrap, spec, architecture, quality, testing, debugging, git-safety, security, concurrency, memory, verification, review) — loaded only when a task triggers them |
| `v2/plantillas/` | Templates: AGENTS.md, DECISIONS (ADR format), SPEC, `verificar.sh`, `pre-commit` hook |
| `v2/Manual-v2.md` | The field manual (English + Español) — day-one flows, acceptance tours, rotation, tags |
| `v2/LEDGER.md` | The error ledger — every escape of the system, converted into a check |

## How it works

1. **Master bootstraps:** discovers the product, writes SPEC.md and DECISIONS.md, scaffolds the minimum, installs the teeth (`verificar.sh` + pre-commit hook), copies the 12 skills into the project, proves a vertical slice.
2. **Disk remembers:** AGENTS.md is the door; DECISIONS.md holds the why; the skills hold the how. Knowledge lives in files, not chats.
3. **Worker continues:** smallest safe change, one task per message, verification with pasted evidence (command + exit code + summary), memory updated in place.
4. **Teeth decide:** `verificar.sh --fast` after each edit, `--full` before every commit (hook-enforced, and the verifier itself is shielded). A claim without pasted evidence is an opinion.
5. **Fresh chats rotate by milestone:** one feature or bug per chat; the repository carries the state.

## The life flow

- **New project** → master flow (F0–F6). It ends with the relay test: a fresh chat, using only what is on disk, must complete a trivial task. No relay test, no bootstrap.
- **Everyday work** → worker flow: one task per message, report + commit, rotate by milestone.
- **Big changes** → adversarial review: a FRESH chat audits the diff against SPEC / DECISIONS / AGENTS without the author's reasoning (the `code-reviewer` skill).

## License

MIT — see [LICENSE](LICENSE).

---

# Español

# Maestro-Disco-Worker

**Un sistema operativo completo para construir software con agentes de IA — desde cualquier app de chat con acceso a archivos.**

Master → Disco → Worker: un master de arranque convierte una idea en un repositorio que se documenta solo, un worker de continuación lo hace crecer, y la verificación mecánica decide qué significa "terminado".

> **La IA no es la memoria del proyecto. La IA trabaja SOBRE la memoria del proyecto.**

Las conversaciones son desechables. El repositorio — SPEC, decisiones, AGENTS.md, skills, tests, verificador — ES el proyecto. Cualquier agente, cualquier app, cualquier modelo puede retomarlo y continuarle.

## Inicio rápido (5 minutos)

Requisitos: cualquier app de chat con modo agente y acceso a archivos (lectura/escritura + comandos).

1. **Consigue la caja de herramientas:** clona o descarga este repositorio.
2. **Proyecto nuevo:** crea una carpeta vacía para tu proyecto y abre un chat de agente fresco con esa carpeta como workspace.
3. **System prompt:** pega el contenido de [`v2/1-nucleo/boot-card-master-v2.md`](v2/1-nucleo/boot-card-master-v2.md).
4. **Un mensaje:** pega el contenido de [`v2/1-nucleo/master-nucleo-v2.md`](v2/1-nucleo/master-nucleo-v2.md) — el contrato completo cabe en UN solo mensaje.
5. **Arranca:** envía `EMPEZAR` con tu idea ("quiero construir X que hace Y"). El mensaje de arranque exacto y las plantillas de flujo están en el Manual (§ El flujo de mensajes).

El master ejecuta las fases **F0–F6** — discovery → SPEC → decisiones → fundación + verificación mecánica → skills + AGENTS.md → primer slice vertical → **test de relevo** — y deja un proyecto que cualquier chat fresco puede continuar sin la conversación original.

**Continuar un proyecto existente** (el otro 95% de tu vida): system prompt = [`v2/2-worker/boot-card-worker-v2.md`](v2/2-worker/boot-card-worker-v2.md), luego [`v2/2-worker/worker-v2.md`](v2/2-worker/worker-v2.md) en un mensaje, luego EMPEZAR + chequeo de salud. Detalles en el Manual.

## Qué hay aquí

| Ruta | Qué es |
|---|---|
| `v2/1-nucleo/` | Boot card + núcleo del master — el contrato de arranque (~123 líneas) |
| `v2/2-worker/` | Boot card + contrato del worker — sesiones de continuación (~100 líneas) |
| `v2/kit/skills/` | Las 12 Agent Skills (bootstrap, spec, arquitectura, calidad, testing, debugging, git-safety, seguridad, concurrencia, memoria, verificación, review) — se cargan solo cuando la tarea las dispara |
| `v2/plantillas/` | Plantillas: AGENTS.md, DECISIONS (formato ADR), SPEC, `verificar.sh`, hook `pre-commit` |
| `v2/Manual-v2.md` | El manual de campo (English + Español) — flujos del día-1, tours de aceptación, rotación, tags |
| `v2/LEDGER.md` | El ledger de errores — cada escape del sistema, convertido en check |

## Cómo funciona

1. **El master arranca:** descubre el producto, escribe SPEC.md y DECISIONS.md, scaffoldea el mínimo, instala los dientes (`verificar.sh` + hook pre-commit), copia las 12 skills al proyecto, prueba un slice vertical.
2. **El disco recuerda:** AGENTS.md es la puerta; DECISIONS.md guarda el porqué; las skills guardan el cómo. El conocimiento vive en archivos, no en chats.
3. **El worker continúa:** cambio mínimo seguro, una tarea por mensaje, verificación con evidencia pegada (comando + exit code + resumen), memoria actualizada in-place.
4. **Los dientes deciden:** `verificar.sh --fast` tras cada edición, `--full` antes de cada commit (lo exige el hook, y el verificador está blindado). Un claim sin evidencia pegada es una opinión.
5. **Chats frescos rotan por hito:** una feature o un bug por chat; el estado lo lleva el repositorio.

## El flujo de vida

- **Proyecto nuevo** → flujo master (F0–F6). Termina con el test de relevo: un chat fresco, usando solo lo que hay en disco, debe completar una tarea trivial. Sin relevo, no hay bootstrap.
- **Día a día** → flujo worker: una tarea por mensaje, reporte + commit, rotación por hitos.
- **Cambios grandes** → revisión adversarial: un chat FRESCO audita el diff contra SPEC / DECISIONS / AGENTS sin conocer el razonamiento del autor (la skill `code-reviewer`).

## Licencia

MIT — ver [LICENSE](LICENSE).
