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

## spec-writing — NUEVA

Fuente: patrón spec-driven development (SDD 2026) — Plan Maestro §2 (skill nueva, "~80 líneas") y §3.1 (F1 del núcleo produce SPEC.md); Síntesis Maestra Fase 1 (voto mentor: formalizar el reporte de bootstrap como SPEC.md con criterios de aceptación verificables, adaptación ligera de la propuesta de Google). Sin filas de cobertura: no tiene origen en v1.1. Revisión personal del dueño al cierre de F1.

## verification-reporting — origen §§74-78 + §120

Inventario: 14 normas → **P: 14 · F: 0 · D: 0**.

Aporte v2.0 (Síntesis Maestra, consenso refinado del tribunal 1, sin fila por no tener origen v1.1): evidencia pegada ACOTADA — comando + exit code + resumen numérico, nunca logs enteros; "un claim sin comando pegado es opinión".

| # | Norma origen (comprimida) | Disposición |
|---|---|---|
| 74.1 | Clasificar conclusiones inciertas: high / moderate / low / blocked | P · Confidence Scale |
| 74.2 | Low/blocked con riesgo real: investigar más, reducir scope, opción reversible o preguntar | P · Confidence Scale |
| 74.3 | Nunca convertir incertidumbre en hecho en silencio | P · Confidence Scale + Safety |
| 75.1 | Términos definidos: Verified / Assumed / Unknown / Blocked | P · Verification Language |
| 75.2 | Nunca usar verified/tested/works/passes/built/deployed sin que ocurrió; no inferir éxito del código correcto; si no corrió, no pasó; bloqueo se explica | P · Verification Language |
| 76.1 | Un check solo es válido si su evidencia es relevante para el claim (ejemplos: leer código ≠ runtime; typecheck ≠ lógica; unit ≠ deploy; build ≠ producción; review ≠ ejecución) | P · tabla Check Must Match |
| 76.2 | Igualar la fuerza del claim a la fuerza de la evidencia | P · tabla + Reporting |
| 77.1 | Trabajo bloqueado: qué falta, por qué importa, qué SÍ está verificado, siguiente acción más segura | P · Blocked Work |
| 77.2 | Nunca fabricar resultados ni sustituir en silencio una implementación materialmente distinta | P · Blocked Work + Safety |
| 78.1 | Completo = resultado logrado de forma fiable (comportamiento existe, causa raíz abordada, verificado, regresiones consideradas, diff limpio, conocimiento sincronizado, incertidumbre comunicada) | P · Completion Standard |
| 78.2 | El estándar NO es "archivos cambiados" | P · Completion Standard |
| 120.1 | Checklist final antes de declarar completa una tarea (15 ítems: comportamiento, ACs, preservación, tests, checks estáticos, diff) | P · Final Checklist |
| 120.2 | Higiene del diff: sin debug, sin temporales, sin secrets, sin cambios no relacionados | P · Final Checklist |
| 120.3 | Contratos/APIs, seguridad de datos/migraciones y sincronización de docs considerados donde apliquen | P · Final Checklist |

## git-safety — origen §§13-14 + §§55-58 + §§63-64

Inventario: 25 normas → **P: 22 · F: 3 · D: 0**.

| # | Norma origen (comprimida) | Disposición |
|---|---|---|
| 13.1 | Git como fundación cuando esté disponible | F → bootstrap-foundation (Git, Safety and Recovery) |
| 13.2 | Nuevo: init cuando proceda + .gitignore + checkpoints sin ruido | F → bootstrap-foundation (idem) |
| 13.3 | Antes de tocar existente: git status, entender cambios, preservar | P · Before Meaningful Changes |
| 13.4 | Uncommitted ≠ desechable | P · Before Meaningful Changes + Protected Work |
| 13.5 | Sin comandos destructores ni reescritura de historia sin autorización | P · Before Meaningful Changes + Safety |
| 14.1 | Git es VCS, no backup universal | P · Recovery (intro) |
| 14.2 | Recuperación proporcional al riesgo | F → bootstrap-foundation (idem) |
| 14.3 | Sin copias duplicadas inútiles | P · Recovery (backups organizados) |
| 14.4 | Punto de recuperación antes de operaciones destructivas | P · Recovery paso 5 |
| 55.1 | Antes de cambios: status, rama, historia reciente, modificaciones existentes | P · Before Meaningful Changes |
| 55.2 | Lista de prohibidos sin autorización: reset/clean/revert/overwrite/delete untracked/stash/rewrite | P · Before Meaningful Changes |
| 55.3 | Git status no define propiedad; uncommitted puede ser intencional | P · Before Meaningful Changes |
| 56.1 | Checkpoint = estado significativo recuperable (fundación/arquitectura/feature/migración/hito) | P · Checkpoints |
| 56.2 | Sin secrets/temporales/debug/generados-excluidos en commits; sin commits basura | P · Checkpoints |
| 56.3 | Sin amend/reescritura de commits ajenos | P · Checkpoints |
| 57.1 | Destructivo/alto riesgo: verificar target y scope, entender rollback, dry runs, checkpoint | P · Recovery 1-5 |
| 57.2 | Tracked ≠ seguro de destruir | P · Recovery |
| 57.3 | Estado externo importante: estrategia del proyecto; backups organizados y distinguibles | P · Recovery |
| 58.1 | Inspeccionar antes de sobrescribir; edición focalizada > reescritura total; no regenerar configs a ciegas | P · File Safety |
| 58.2 | Herramientas automáticas: scope antes, diff resultante, revertir modificaciones accidentales | P · File Safety |
| 63.1 | Lista de protección: committed/staged/unstaged/untracked/config local/estado local generado/no-Git | P · Protected Work |
| 63.2 | Uncommitted ≠ desechable (énfasis worker) | P · Protected Work |
| 63.3 | Solape con trabajo del usuario: inspeccionar, preservar, mínimo cambio, explicar conflictos | P · Protected Work |
| 64.1 | Cambios atribuibles: identificar creadados/cambiados/borrados/generados/migraciones/docs/config; cambio inesperado → investigar | P · Change Isolation |
| 64.2 | Nunca normalizar diffs grandes no relacionados como "cleanup" | P · Change Isolation |

Nota: la recuperación ante errores PROPIOS (§70) vive en la skill debugging; el protocolo de 5 pasos está repetido aquí en Change Isolation por operatividad (1 línea de solape declarada).

## testing — origen §§48-54

Inventario: 26 normas → **P: 26 · F: 0 · D: 0**.

§§52-54 (tool failures, pre-existing failures, protocolo de debugging) se mudan a la skill debugging (skill 8, origen §§52-54 + §70) — puntero en la sección "On Failures".

| # | Norma origen (comprimida) | Disposición |
|---|---|---|
| 48.1 | Cambios comportamentales significativos → tests apropiados añadidos/actualizados | P · What Gets Tested |
| 48.2 | Seguir el estilo/framework de testing existente del proyecto | P · What Gets Tested |
| 48.3 | Testear comportamiento observable, no internos (salvo interno = contrato) | P · What Gets Tested |
| 48.4 | Cubrir edge cases y failure paths relevantes | P · What Gets Tested |
| 49.1 | Cobertura proporcional al riesgo, no uniforme | P · Coverage Proportional to Risk |
| 49.2 | Prioridad: dominio, seguridad, integridad de datos, fundamentos difíciles, integraciones propensas a regresión | P · Coverage (lista 1-5) |
| 49.3 | Bajo valor: accessors triviales, generado, cosmética | P · Coverage |
| 49.4 | Ni dogma 100% ni cero tests para comportamiento significativo | P · Coverage |
| 50.1 | NUNCA debilitar/borrar/saltar aserciones para pasar | P · Test Integrity + Safety |
| 50.2 | Test obsoleto legítimo → reemplazo con cobertura equivalente, declarado | P · Test Integrity |
| 50.3 | Requisito cambiado → tests cambiados en la misma tarea (documentan intención) | P · Test Integrity |
| 51.1 | Validación progresiva en círculos que se ensanchan (4 pasos) | P · Progressive Validation |
| 51.2 | Ni validación cara a ciegas ni saltos a ciegas | P · Progressive Validation |
| 51.3 | Cadencia --fast por edición / --full antes de commit | P · Progressive Validation (aporte v2: dientes mecánicos) |
| 52.1 | Fallo de tool: leer error, clasificar propio/entorno/preexistente, sin cambios aleatorios | P → debugging (mudada, puntero) |
| 52.2 | Fix verificado tras corregir | P → debugging (mudada) |
| 52.3 | Fallo preexistente no bloqueante → reportar, no tocar | P → debugging (mudada) |
| 53.1 | Identificar y reportar fallos preexistentes con claridad | P → debugging (mudada) |
| 53.2 | Distinguir fallo nuevo de preexistente | P → debugging (mudada) |
| 53.3 | No ocultar fallos preexistentes ni "arreglar" lo no relacionado para verde | P → debugging (mudada) |
| 54.1 | Protocolo: leer error → localizar → clasificar → hipótesis → verificar | P → debugging (mudada) |
| 54.2 | Corrección mínima + re-validar | P → debugging (mudada) |
| 54.3 | Sin cambios aleatorios hasta que el error desaparezca | P → debugging (mudada) |
| 54.4 | Sin modificar código no relacionado por verde | P → debugging (mudada) |
| 54.5 | Diagnóstico con datos reales cuando el síntoma mienta | P → debugging (mudada) |
| 54.6 | Determinar causado por mis cambios vs preexistente | P → debugging (mudada) |

## architecture-design — origen §§17-33

Inventario: 39 normas → **P: 38 · F: 1 · D: 0**.

| # | Norma origen (comprimida) | Disposición |
|---|---|---|
| 17.1 | Análisis previo: qué se pide, problema, consumidores, actual vs esperado, cambia/no-cambia, componentes, ACs, riesgos, constraints | P · Requirement Analysis |
| 17.2 | Traducir requisito vago a comportamiento concreto | P · Requirement Analysis |
| 17.3 | No inventar requisitos | P · Requirement Analysis |
| 17.4 | Ambigüedad: baja → convención; alta → preguntar; no preguntar lo que no afecta materialmente | P · Requirement Analysis |
| 18.1 | Prioridades en conflicto (10 niveles) | P · Priorities |
| 18.2 | Nunca sacrificar prioridad alta por baja; trade-offs explícitos | P · Priorities |
| 19.1 | ACs concretas y medibles ANTES de implementar | P · Acceptance Criteria |
| 19.2 | "Funciona" no es criterio; en v2 = SPEC.md por IDs | P · Acceptance Criteria (punte a spec-writing) |
| 20.1 | Decisión significativa: alternativas → evaluar → más simple viable → justificar → registrar (formato ADR) | P · Architectural Reasoning |
| 21.1 | Complejidad proporcional al problema real | P · Complexity Matches the Problem |
| 21.2 | Empezar simple; complejidad solo con evidencia; costura limpia para evolucionar | P · Complexity |
| 22.1 | Dependencias apuntan a estabilidad; política no depende de detalles volátiles | P · Dependency Direction |
| 22.2 | Sin dependencias circulares; infra/UI enchufables en el límite del dominio | P · Dependency Direction |
| 23.1 | Investigar capacidades/límites ANTES de construir sobre tecnología crítica | P · Technology Research |
| 23.2 | Calidad de fuentes: oficial > código > tests > artículos > memoria del modelo | P · Technology Research |
| 23.3 | Nunca fabricar APIs/comandos/flags/rutas; verificación experimental si es crítico; vigilar staleness (versiones/fechas) | P · Technology Research |
| 24.1 | Información externa: verificar con fuente autoritativa; notas de versión/fecha | F · Technology Research (fusionada con 23.2-23.3) |
| 25.1 | Política de dependencias: stdlib > establecida > nueva | P · Dependency Policy |
| 25.2 | Evaluar: mantenimiento, seguridad, licencia, transitivas, tamaño, compatibilidad | P · Dependency Policy |
| 25.3 | Pin de versiones + lockfiles; sin upgrades por novedad | P · Dependency Policy |
| 26.1 | Estructura alrededor del dominio; agrupar por feature; relacionados juntos; la estructura comunica intención | P · Project Structure |
| 26.2 | Separar concerns reales: UI, lógica, datos, infra; extraer compartidos deliberadamente | P · Project Structure |
| 27.1 | Esqueleto básico antes de código sustancial; evolución previsible sin sobre-ingeniería | P · Project Structure |
| 27.2 | Si la estructura pelea contra el trabajo, arreglarla temprano | P · Project Structure |
| 28.1 | Config separada del código; defaults sensatos; variables requeridas documentadas | P · Configuration |
| 28.2 | Validación al arranque con error claro que nombre la clave | P · Configuration |
| 28.3 | Sin hardcode de valores por entorno; build-time vs runtime explícito | P · Configuration |
| 29.1 | Secrets jamás en VCS/código/logs; .env ignorado o gestor; documentar sin valores | P · Secrets |
| 29.2 | Fail fast con mensaje claro si falta; rotar lo expuesto por accidente | P · Secrets |
| 30.1 | Entornos objetivo explícitos (dev/test/prod); diferencias documentadas; sin "works on my machine" | P · Environments |
| 30.2 | Documentar supuestos: SO, versiones, servicios | P · Environments |
| 31.1 | APIs deliberadas: consistencia, claridad, errores explícitos sin fugas internas | P · API and Contract Design |
| 31.2 | Validación en fronteras; estrategia de versiones; compatibilidad salvo ruptura explícita; idempotencia donde habrá retries | P · API and Contract Design |
| 31.3 | Contratos documentados; nunca cambiar comportamiento observable en silencio | P · API and Contract Design |
| 32.1 | Modelar dominio explícito: entidades, relaciones, constraints, invariantes; el schema captura reglas de negocio | P · Data Modeling |
| 32.2 | Requerido vs opcional por campo; índices según patrones de acceso; camino de migración desde el día 1 | P · Data Modeling |
| 33.1 | Schema como código: versionado, revisable, reversible | P · Database and Migrations |
| 33.2 | Test de migraciones con datos representativos; destructivas con backup + dry-run + staged | P · Migrations |
| 33.3 | Nunca irreversible sobre datos de producción sin autorización + backup fresco; cada migración documenta intención | P · Migrations + Safety |

## code-quality — origen §37 + §§41-47

Inventario: 20 normas → **P: 20 · F: 0 · D: 0**.

Aporte v2.0 sin fila (escape histórico del proyecto piloto, semilla del Ledger — Manual v1.1 §9): botones de formulario HTML sin type explícito son submit por defecto y mueren en silencio → regla "todo botón declara su intento" en UI Behavior.

| # | Norma origen (comprimida) | Disposición |
|---|---|---|
| 37.1 | UI: matriz de estados completa (loading/empty/success/error/retry/disabled/offline) | P · UI Behavior |
| 37.2 | Responsive, teclado, foco gestionado/trap en diálogos, HTML semántico, screen readers | P · UI Behavior |
| 37.3 | El happy path no es suficiente | P · UI Behavior |
| 41.1 | Resolver el problema real; constructos estándar sobre cleverness | P · Implementation |
| 41.2 | Explícito sobre implícito; sin acción a distancia | P · Implementation |
| 41.3 | Funciones/módulos cohesivos con nombre que coincida | P · Implementation |
| 41.4 | Manejo de errores diseñado, no accidental | P · Implementation |
| 41.5 | Artefactos de debug eliminados antes de completar | P · Implementation + Safety |
| 42.1 | Cambios mínimos, focalizados, reversibles | P · Change Scope |
| 42.2 | Sin cambios drive-by mezclados; cosmética solo si sirve a la tarea | P · Change Scope |
| 43.1 | Optimizar para el lector; nombres honestos; comentarios por-quí | P · Readability and Naming |
| 43.2 | Código donde el lector lo espera (convenciones); borrar muerto/comentado | P · Readability and Naming |
| 44.1 | Abstraer cuando la duplicación es real Y la abstracción es claramente mejor | P · Abstraction |
| 44.2 | Poca duplicación es más barata que la abstracción equivocada; repetir honesto antes de extraer | P · Abstraction |
| 45.1 | Tipos más fuertes que el lenguaje permita en la práctica; any/dynamic solo en bordes justificados | P · Type Safety |
| 45.2 | Tipar en fronteras; input externo validado antes de confiar | P · Type Safety |
| 46.1 | Validar en fronteras (usuario, APIs externas, config, entorno); fail fast con error informativo | P · Validation |
| 46.2 | Rechazar temprano; cada caso malo tiene decisión; validar antes de persistir | P · Validation |
| 47.1 | Preservar comportamiento observable salvo cambio explícito | P · Backwards Compatibility |
| 47.2 | Deprecar antes de eliminar; versionar rupturas; jamás romper consumidores en silencio | P · Backwards Compatibility |
