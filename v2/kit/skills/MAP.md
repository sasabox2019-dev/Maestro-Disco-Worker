# MAP.md — Contrato de cobertura del mapa de mudanza (v2.0)

Una fila por norma de origen del master v1.1 (`old/1/2master-bootstrap.md`).
Disposición: **P** = presente en la skill (sección) · **F** = fusionada (sección) · **D** = descartada (test y razón).
Ninguna norma se descarta por longitud — solo por test (a) deducible del código genérico o (b) micro-paso/vaguedad.

---

## bootstrap-foundation — origen §§4-16 + §§79-107

Inventario: 125 normas (48 en §§4-16 · 77 en §§79-107) → **P: 123 · F: 2 · D: 0**.

### Bloque §§4-16 (fundación general)

| # | Norma origen (comprimida) | Disposición |
|---|---|---|
| 4.1 | Bootstrap = descubrir/establecer el proyecto + materializar conocimiento mínimo útil | P · Objective |
| 4.2 | El proyecto NO depende de la conversación (arquitectura, decisiones, comandos, constraints, integraciones, estructura) | P · Objective |
| 5.1 | Sin detalle técnico: no crear stack arbitrario de inmediato; entender el producto primero | P · Discovery Conversation |
| 5.2 | Preguntar qué construir antes que la dirección técnica | P · Discovery (secuencia 1-2) |
| 5.3 | Determinar tipo de proyecto (web/desktop/CLI/librería/API/…) | P · Discovery (secuencia 4) |
| 5.4 | Preguntar preferencias técnicas existentes (lenguaje, framework, BD, deployment, plataformas, servicios, perf, seguridad, compatibilidad) | P · Discovery (secuencia 5-6) |
| 5.5 | Nunca interrogar con cuestionario enorme | P · Discovery (apertura) |
| 6.1 | Selección autónoma permitida cuando riesgo bajo + elección justificable | P · Technology Selection |
| 6.2 | Criterios: requisitos reales, tipo, madurez ecosistema, mantenibilidad, seguridad, deployment, DX, testing, viabilidad | P · Technology Selection |
| 6.3 | Ni moda ni sofisticación impresionante; sin infra innecesaria | P · Technology Selection |
| 6.4 | Entre opciones razonables: simplicidad + fiabilidad + mantenibilidad + ecosistema | P · Technology Selection |
| 6.5 | Decisiones trascendentes: alternativas y trade-offs ANTES de comprometer | P · Technology Selection + Decision Authority (shared) |
| 7.1 | Jerarquía de decisiones de 8 niveles | P · Decision Authority |
| 7.2 | Una preferencia de nivel inferior nunca pisa un requisito de nivel superior | P · Decision Authority |
| 7.3 | Delegación explícita del usuario → decidir con evidencia y constraints reales | P · Decision Authority + Discovery ("you decide") |
| 7.4 | No devolver repetidamente decisiones rutinarias | P · Decision Authority |
| 8.1 | No explorar el repo a ciegas; discovery progresivo | P · Discovery Conversation |
| 8.2 | Objetivo: entender lo necesario para la siguiente decisión importante, no leer todo | P · Discovery Conversation |
| 8.3 | Proyecto nuevo: contexto global suficiente para decidir arquitectura responsablemente | P · Discovery (última línea de preguntas) |
| 9.1 | Determinar cuando aplique antes de código sustancial (propósito→escala, ~20 ítems) | P · Discovery (párrafo "Before substantial code") |
| 9.2 | No inventar requisitos | P · Discovery |
| 9.3 | Distinguir fuentes: usuario / hechos / supuestos / recomendaciones / sin resolver | P · Discovery (source discipline) |
| 10.1 | Determinar tipo de workspace (vacío/parcial/existente/legacy/prototipo/monorepo/…) | P · Discovery (workspace no vacío) + Project Foundation |
| 10.2 | Proyecto existente ≠ lienzo en blanco | P · Project Foundation |
| 10.3 | Entender antes de reemplazar; preservar comportamiento, cambios, convenciones; evitar migraciones innecesarias | P · Discovery + Project Foundation |
| 10.4 | Vacío real: fundación coherente, solo lo necesario, sin complejidad especulativa | P · Project Foundation |
| 11.1 | El contexto específico del proyecto no duplica la política universal | F · Materialization (tabla AGENTS.md: "never a copy of the universal prompt, never generic advice") |
| 11.2 | Conflicto contexto vs repo: detectar → investigar → staleness → evidencia autoritativa → preguntar si es material | P · Materialization (último párrafo) |
| 12.1 | Sin artefactos ceremoniales ("debería tenerlos") | P · Project Foundation |
| 12.2 | Cada artefacto con propósito; necesario y útil > impresionante y elaborado | P · Project Foundation |
| 12.3 | Escalar docs y proceso al proyecto real (script→README; servicio serio→docs completas) | P · Proposal (ceremony scaling) + Materialization (tabla) |
| 13.1 | Git como fundación de versionado cuando esté disponible | P · Git, Safety and Recovery |
| 13.2 | Proyecto nuevo: init cuando proceda, .gitignore sensato, checkpoints coherentes, sin ruido | P · Git, Safety |
| 13.3 | Antes de tocar existente: git status, entender cambios, preservarlos | P · Git, Safety |
| 13.4 | Uncommitted ≠ desechable | P · Git, Safety + Safety |
| 13.5 | Sin comandos destructores ni reescritura de historia sin autorización | P · Git, Safety + Safety |
| 14.1 | Git es VCS, no backup universal | P · Git, Safety |
| 14.2 | Mecanismos de recuperación según importancia/riesgo (commits, tags, branches, backups BD, snapshots, rollback) | P · Git, Safety |
| 14.3 | Backups proporcionales al riesgo; sin copias duplicadas inútiles | P · Git, Safety |
| 14.4 | Punto de recuperación antes de operaciones destructivas/difíciles de revertir | P · Git, Safety |
| 15.1 | Antes de estructura sustancial: confirmar intent, decisiones, incertidumbres, arquitectura, recuperación | P · Technical Proposal and Checkpoint |
| 15.2 | Proyecto pequeño y obvio: sin ceremonia innecesaria | P · Proposal (approval theater) |
| 15.3 | Proyecto sustancial: presentar decisiones arquitectónicas antes de implementar | P · Proposal |
| 15.4 | Ni aprobación por trivia ni silencio ante decisión irreversible mayor | P · Proposal + Safety |
| 16.1 | Pensar antes de actuar; no narrar el monólogo interno | P · Implementation Start (working style) |
| 16.2 | Comunicar decisiones, evidencia, riesgos y acciones al nivel apropiado | P · Implementation Start |
| 16.3 | Ciclo pequeño (investigar→decidir→implementar→verificar) vs sustancial (+proponer, documentar) | P · Implementation Start |
| 16.4 | Ejecución disciplinada, no planificación performativa | P · Implementation Start |

### Bloque §§79-107 (modo bootstrap)

| # | Norma origen (comprimida) | Disposición |
|---|---|---|
| 79.1 | Objetivo del modo: idea → requisitos → decisiones → fundación → conocimiento → repo implementation-ready | P · Objective |
| 79.2 | No escribir código de aplicación solo porque el workspace está vacío | P · Objective |
| 79.3 | Solo preguntas que afecten materialmente (scope, plataforma, arquitectura, tech, datos, seguridad, deployment, coste, compatibilidad, UX) | P · Discovery |
| 79.4 | Default razonable de bajo riesgo: proponerlo en vez de preguntar | P · Objective + Discovery |
| 80.1 | Preguntas de producto: qué, problema, quién, workflow primario, versión mínima útil, features clave, futuro que afecte arquitectura | P · Discovery (secuencia + future requirements) |
| 80.2 | No asumir la plataforma desde la descripción inicial | P · Discovery (secuencia 4) |
| 80.3 | Preferencias obligatorias o elegir con criterio y explicar brevemente | P · Discovery + Technology Selection |
| 80.4 | Sin lista abrumadora de tecnologías cuando hay una claramente superior | P · Technology Selection |
| 81.1 | Decisiones del USUARIO (comportamiento, usuarios, plataformas, tech obligatoria, presupuesto, compatibilidad, reglas de negocio) | P · Decision Authority |
| 81.2 | Decisiones del AGENTE (carpetas, naming, tools de test, límites módulos, helpers, patrones) | P · Decision Authority |
| 81.3 | Compartidas (arquitectura mayor, BD, auth, cloud, API pública, infra cara, migraciones irreversibles, framework): recomendación + rationale antes | P · Decision Authority (shared) |
| 81.4 | Actuar como el experto técnico; no pedir al usuario detalles que no tiene por qué cuidar | P · Decision Authority |
| 82.1 | Preguntas progresivas; empezar por el conjunto mínimo | P · Discovery |
| 82.2 | Secuencia inicial útil de 7 preguntas | P · Discovery |
| 82.3 | Detalles adicionales solo cuando las respuestas los hagan relevantes | P · Discovery |
| 82.4 | "Tú decide" = tomar la responsabilidad; sin confirmaciones repetidas | P · Discovery |
| 83.1 | Workspace no vacío ≠ proyecto en blanco: qué existe, Git, trabajo a preservar | P · Discovery |
| 83.2 | Inspeccionar antes de crear/reemplazar; nunca asumir que un directorio "con pinta de vacío" es desechable | P · Discovery + Safety |
| 84.1 | Propuesta concisa: tipo, stack, runtime, arquitectura, componentes, almacenamiento, integraciones, testing, workflow, deployment, constraints | P · Technical Proposal |
| 84.2 | No sobre-diseñar; arquitectura simple que evolucione con seguridad | P · Proposal |
| 84.3 | Decisiones significativas: qué / por qué / alternativas / trade-offs / riesgos | P · Technology Selection + Proposal |
| 84.4 | Sin ensayo de arquitectura cuando el proyecto es simple | F · Proposal ("concise" + ceremony scaling) |
| 85.1 | El usuario debe poder entender: qué, tech, arquitectura general, qué primero, supuestos, trade-offs | P · Proposal |
| 85.2 | Low-risk sin paradas; alto impacto: confirmar cuando la preferencia importe | P · Proposal |
| 85.3 | Dirección fijada → autonomía rutinaria; no relitigar lo decidido | P · Proposal |
| 86.1 | Fundación mínima coherente que el stack exija (estructura, config, tests, lint, scripts, docs, ignore, CI si procede) | P · Project Foundation |
| 86.2 | Sin infra de plantilla; cada componente con razón de existir | P · Project Foundation |
| 87.1 | Init local + .gitignore + checkpoint inicial + preservar archivos del usuario | P · Git, Safety |
| 87.2 | Repo local suficiente (historia, recuperación, checkpoints, agentes); remoto aparte | P · Git, Safety |
| 87.3 | Nunca crear/publicar remoto sin autorización | P · Git, Safety + Safety |
| 88.1 | Antes de implementación autónoma: Git state, baseline recuperable, directorio correcto, no pisar trabajo ajeno | P · Git, Safety |
| 88.2 | Nuevo vacío: checkpoint inicial útil; parcialmente poblado: preservar historia y trabajo | P · Git, Safety |
| 88.3 | No forzar working tree limpio destruyendo/ocultando cambios del usuario | P · Git, Safety + Safety |
| 89.1 | La conversación es temporal; el conocimiento se persiste en archivos del repo | P · Knowledge Materialization |
| 89.2 | Mínimo: AGENTS.md + README.md | P · Materialization (tabla) |
| 89.3 | Docs adicionales solo con valor real; no todas por defecto | P · Materialization (tabla) |
| 90.1 | AGENTS.md = entrada operativa: qué es, límites, dónde está, comandos, reglas, profundizar, qué verificar | P · Materialization (tabla) |
| 90.2 | Índice y guía operativa; nunca copia del prompt universal; sin consejos genéricos | P · Materialization (tabla) [cubre también 11.1] |
| 91.1 | Mapa conciso del proyecto en AGENTS.md | P · Materialization (párrafo del mapa) |
| 91.2 | Adaptar al proyecto real; no documentar cada archivo; lo que ayuda a navegar | P · Materialization |
| 91.3 | El mapa evoluciona cuando cambia la estructura importante | P · Materialization |
| 92.1 | README para humanos: propósito, capacidades, prerequisitos, instalación, dev, testing, build, deploy, config, enlaces | P · Materialization (tabla) |
| 92.2 | No convertir README en manual de arquitectura; útil al recién llegado | P · Materialization (tabla) |
| 93.1 | ARCHITECTURE.md solo si la complejidad lo justifica | P · Materialization (tabla) |
| 93.2 | Documentar solo lo difícil de inferir del código; no cada clase/función | P · Materialization (tabla) |
| 94.1 | DECISIONS.md cuando haya decisiones que preservar (framework, BD, enfoque, alternativas rechazadas, compatibilidad) | P · Materialization (tabla) |
| 94.2 | Formato: decisión, contexto, rationale, alternativas, consecuencias; sin trivialidades | P · Materialization (tabla) |
| 95.1 | DEVELOPMENT.md solo si el workflow lo justifica | P · Materialization (tabla) |
| 95.2 | Comandos ejecutables e instrucciones concretas sobre prosa vaga | P · Materialization (tabla) |
| 96.1 | Jerarquía: AGENTS.md → mapa + reglas → docs relevantes → código + tests | P · Materialization ("AGENTS.md is the door") |
| 96.2 | No exigir leer todo antes de cada tarea; AGENTS.md es la puerta; la tarea decide | P · Materialization |
| 97.1 | Procedimiento progresivo del agente futuro (AGENTS → Git → qué afecta → docs → código → expandir) | P · Materialization (línea compacta) |
| 97.2 | Entendimiento suficiente, no lectura máxima | P · Materialization |
| 98.1 | Registrar decisiones antes de que se olviden: stack, versiones, arquitectura, límites, constraints, comandos, tests, supuestos, pendientes materiales | P · Materialization (párrafo "Record after") |
| 98.2 | Conocimiento durable, no detalles conversacionales temporales | P · Materialization |
| 99.1 | Jerarquía de verdad para hechos del proyecto (8 niveles) | P · Source of Truth |
| 99.2 | El usuario define el resultado deseado; el repo define qué existe | P · Source of Truth |
| 99.3 | Conflicto repo vs petición: nunca elegir en silencio; entender y resolver | P · Source of Truth |
| 100.1 | Cambio de arquitectura/comandos/estructura → actualizar conocimiento en el mismo cambio; quitar obsoleto; preservar historia útil | P · Materialization (Consistency) |
| 100.2 | Docs y código en desacuerdo → investigar y corregir el stale; docs nunca segunda implementación en conflicto | P · Materialization (Consistency) + Safety |
| 101.1 | Secuencia con confianza temprana (identidad → runtime → arquitectura → tests → slice → validación → expansión → conocimiento) | P · Implementation Start |
| 101.2 | No construir fundación enorme antes de validar la idea central | P · Implementation Start |
| 102.1 | Slice vertical end-to-end temprano (o equivalente del proyecto) | P · Implementation Start |
| 102.2 | Valida arquitectura, tooling, integraciones, flujo de datos, deployment, tests a la vez | P · Implementation Start |
| 102.3 | No forzar slice donde la arquitectura no se beneficie | P · Implementation Start |
| 103.1 | Completo SOLO cuando el proyecto se entiende y continúa sin esta conversación | P · Completion Test |
| 103.2 | Debe dejar: estructura, tech documentada, decisiones, comandos usables, validación, mapa, contexto persistente | P · Completion Test + Handoff checklist |
| 103.3 | Test del ingeniero competente (repo + prompt de continuación, sin el chat) | P · Completion Test (cita) |
| 104.1 | Checklist de handoff: AGENTS útil, README preciso, docs justificadas, comandos reales, docs=código, decisiones, Git, validación, sin secrets | P · Handoff checklist |
| 104.2 | El repo queda listo para otra sesión, otro agente, otro modelo | P · Completion Test |
| 105.1 | Sin dependencia del modelo: nada privado, oculto, temporal o modelo-específico en disco | P · Materialization (Model independence) |
| 105.2 | Guardar hechos, decisiones, constraints, arquitectura, comandos, convenciones, procedimientos, supuestos durables | P · Materialization |
| 105.3 | La IA no es la memoria; la IA trabaja SOBRE la memoria del proyecto | P · Materialization |
| 106.1 | El proyecto debe sobrevivir: chat desaparece, modelo cambia, tool cambia, otro ingeniero, meses después | P · Completion Test |
| 106.2 | Conocimiento esencial solo en la conversación = no materializado | P · Completion Test |
| 107.1 | Reporte final: Established / Created or changed / Verified / Remaining | P · Bootstrap Report |
| 107.2 | Sin "production-ready" inflado; lenguaje preciso sobre lo validado de verdad | P · Bootstrap Report + Safety |
