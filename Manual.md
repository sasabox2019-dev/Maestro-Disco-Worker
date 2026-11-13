# MANUAL DE CAMPO — Sistema Master → Disco → Worker
# (Guardar junto a: master-bootstrap.md, worker.md y las 2 boot cards)

═══════════════════════════════════════════
## 0. LA CAJA DE HERRAMIENTAS (5 archivos)
═══════════════════════════════════════════

Guarda TODOS juntos en una carpeta FUERA de los proyectos
(p ej. ~/Proyectos/AI-Engineering/):

1. master-bootstrap.md      ← para proyectos NUEVOS (system prompt corto no cabe: ver truco §1)
2. boot-card-master.txt     ← la tarjeta corta del Master (4.000 car. máx)
3. worker.md                ← para sesiones de proyecto existente
4. boot-card-worker.txt     ← la tarjeta corta del Worker
5. ESTE manual              ← tu chuleta

REGLA DE ORO (el corazón de todo):
  La IA no es la memoria del proyecto. La IA trabaja SOBRE la memoria
  del proyecto (AGENTS.md + DECISIONS.md + Git + tests). Los chats son
  desechables; el disco es eterno.

═══════════════════════════════════════════
## 1. TRUCO BOOT CARD (Chatbox solo admite 4.000 caracteres)
═══════════════════════════════════════════

El prompt largo NUNCA cabe en el system prompt. Solución:

1. System prompt  → la BOOT CARD corta (las 10 reglas duras + "las
   instrucciones completas llegan en los primeros mensajes")
2. Mensaje 1     → "Voy a enviarte tus instrucciones completas en N
   mensajes. No empieces nada: responde solo 'recibido'. Cuando diga
   EMPEZAR, las adoptas."
3. Mensajes 2-N  → el prompt completo pegado (córtese donde haga falta)
4. Mensaje final → "EMPEZAR. [instrucciones adoptadas]. Y ahora: [tarea]"

═══════════════════════════════════════════
## 2. PROYECTO NUEVO — PRIMERA CONVERSACIÓN (Master)
═══════════════════════════════════════════

PASOS:
1. Crear carpeta VACÍA (p ej. ~/Proyectos/nombre-proyecto)
2. Chat nuevo en Chatbox:
   - Modo agente (herramientas de archivos)
   - Workspace: la carpeta nueva
   - Lectura/escritura + internet
3. System prompt: BOOT CARD DEL MASTER
4. Master completo por mensajes (truco §1, son 10 partes)
5. "EMPEZAR" + la idea en UNA frase mínima:
   → "Quiero construir [X] para [uso personal/...] que [qué hace]."
   NO des pistas de lenguaje/stack — que decida él.

RESPUESTAS TÍPICAS DEL DISCOVERY (tenlas preparadas):
- ¿Para quién? → "Solo yo / uso personal"
- ¿Plataforma? → la que quieras (web, terminal, escritorio...)
- ¿Preferencia de lenguaje/framework/base de datos? →
  "No, elige tú y explícame brevemente por qué"  ← LA CLAVE: delegar
- ¿Primera versión útil? → describe lo MÍNIMO, no el sueño completo
- ¿Futuras funciones? → "Quizá más adelante, pero no compliques nada
  por eso ahora"  ← evita sobre-ingeniería
- ¿Confirmación del plan? → "Adelante" (solo si te parece razonable)

QUÉ OBSERVAR (tu cuaderno de bootstrap):
- [ ] ¿Preguntó poco y con propósito (no cuestionario)?
- [ ] ¿Justificó el stack elegido + una alternativa?
- [ ] ¿Creó AGENTS.md (índice, NO copia del prompt) y README?
- [ ] ¿Commits coherentes? (git log al final)
- [ ] ¿Tests ejecutados de verdad?
- [ ] ¿El reporte distingue VERIFICADO de ASUMIDO?
- [ ] ¿Los comandos que documentó funcionan cuando TÚ los ejecutas?

═══════════════════════════════════════════
## 3. SESIONES SIGUIENTES (Worker) — EL 95% DE TU VIDA
═══════════════════════════════════════════

PASOS:
1. Chat nuevo (o continuar el actual si está "fresco" — ver §6)
2. Misma configuración de workspace/herramientas
3. System prompt: BOOT CARD DEL WORKER
4. worker.md por mensajes (2-3 partes) con protocolo "recibido"
5. "EMPEZAR" + CHEQUEO DE SALUD (mensaje para copiar):

   EMPEZAR. Instrucciones adoptadas. Confírmalo en una línea.
   Luego: verificación de salud del proyecto que heredas. Lee AGENTS.md
   (incluye el protocolo de trabajo del proyecto) y ejecuta
   ./scripts/verificar.sh si existe (chequeo integral). Reporta
   brevemente el estado de salud antes de cualquier trabajo.

   → Si el proyecto NO tiene verificar.sh todavía: pídeselo como
     PRIMERA TAREA (ver §8, es la mejor inversión del proyecto)

6. Y luego la tarea: UNA sola por mensaje.

═══════════════════════════════════════════
## 4. PROTOCOLO DE TAREAS (cómo pedir trabajo)
═══════════════════════════════════════════

REGLAS:
- UNA tarea por mensaje. Esperas a que termine (reporte + commit).
- Tareas grandes (GUI, rediseños, nuevas vistas) → pedir SIEMPRE:
  "Antes de construir, preséntame la propuesta" (él propone, tú
  confirmas "adelante según tus votos" si te convence)
- Al delegar: "elige tú y explícame por qué" — y NO re-decidir tú
- Cuando pida confirmación de algo razonable: "Adelante"
- Cambios que implican ROMPER una decisión documentada → él debe
  parar y consultarte; tú decides conscientemente

PLANTILLA DE TAREA (copiar y adaptar):
  Nueva tarea: [QUÉ quieres, en lenguaje humano].
  Debe permitir [comportamiento esperado].
  [Si aplica: reutiliza la arquitectura existente / sigue las
  convenciones del proyecto].
  Antes de construir, preséntame la propuesta. [O: adelante con
  autonomía completa.]
  Verificación: tests + smoke real. Docs sincronizadas. Commit.
  Reporte final al terminar.

PLANTILLA DE BUG (cuando algo falla en tu tour):
  Bug encontrado en [interfaz]: [qué pasa exactamente, con el mensaje
  de error literal]. Diagnica de verdad (reproduce con datos reales,
  no asumas mi hipótesis: [tu sospecha]). Corrige y protege contra
  regresión con tests. Suite completa. Reporte breve.

═══════════════════════════════════════════
## 5. TU ROL: EL TOUR DE ACEPTACIÓN (lo que NADIE puede verificar por ti)
═══════════════════════════════════════════

Los tests cubren dominio y API. TÚ cubres lo que solo un humano ve:
- ¿La ventana/página se abre y se ve BIEN?
- ¿Los botones hacen algo al PULSARLOS (no solo existir)?
- ¿Los diálogos cancelan de verdad (Cancelar/Esc/clic-fuera)?
- ¿Se ve bien en modo oscuro, con datos reales, tras recargar?
- ¿Te resulta cómodo de USAR? (tú eres el usuario final)

REGLA: tras cada hito entregado → tour de 5 minutos antes de aceptar.
Todo bug que encuentres va con la plantilla de bug de §4.

═══════════════════════════════════════════
## 6. ROTACIÓN DE CONVERSACIONES (cuándo cambiar de chat)
═══════════════════════════════════════════

SEÑALES DE QUE EL CHAT ESTÁ CANSADO (rotar YA):
- 🟡 Confunde detalles ya establecidos, repite trabajo hecho
- 🟡 Sus ediciones fallan seguido (batches que no encajan)
- 🟡 Corrupción de archivos ("undefined" literales, imports comidos)
- 🔴 Errores raros, tests verdes falsos, mezcla versiones viejas

EXPERIENCIA REAL: ~15-20 tareas por chat es el límite práctico.
El razonamiento aguanta; el canal de ejecución se degrada.

La rotación NO pierde NADA: el próximo agente se orienta solo con
AGENTS.md + verificar.sh (probado con éxito el 13-sep-2026).

═══════════════════════════════════════════
## 7. MANTENIMIENTO Y RESPALDOS
═══════════════════════════════════════════

TRAS CADA HITO GRANDE:
1. Tour de aceptación (§5)
2. Export de datos: ./bin/[app] export > respaldo-$(date +%F).json
   (guárdalo FUERA del repo — los datos personales nunca van a Git)
3. Push: git push && git tag vX.Y.Z && git push --tags

SUBIR PROYECTO A GITHUB (primera vez, con gh CLI):
  brew install gh && gh auth login   (una vez, HTTPS + navegador)
  gh repo create NOMBRE --public --source=. --push
  git tag vX.Y.Z && git push --tags

ANTES DE PUBLICAR (verificar que no se filtra nada):
  git ls-files | grep -i "\.db\|\.sqlite\|\.env"   → debe dar NADA

GITHUB = respaldo externo gratis + punto de restauración.
Cada día sin push es riesgo.

═══════════════════════════════════════════
## 8. PRIMERA TAREA RECOMENDADA EN TODO PROYECTO NUEVO
═══════════════════════════════════════════

Pedir al agente (tras el bootstrap) que cree:

  ./scripts/verificar.sh — un comando que verifica TODO:
  1. Sintaxis de todo el árbol (compileall + node --check)
  2. Barrido de corrupción conocida ("undefined" literales etc.)
  3. Suite completa de tests con __pycache__ PURGADO
  4. Sincronización de versiones (pyproject == __version__)

  + test anti-drift de versiones (que las versiones duplicadas
    no puedan divergir jamás)
  + Protocolo escrito en AGENTS.md: un edit por llamada, verificar
    cada fichero tocado antes de continuar, verificar.sh ANTES de
    cada commit, y ante errores imposibles → re-verificar bytes.

POR QUÉ: el pycache obsoleto hizo pasar tests verdes con código
roto, y la corrupción de archivos pasó varias auditorías. Este
script convierte esas crisis invisibles en fallos visibles en
segundos. ES LA MEJOR INVERSIÓN DEL PROYECTO ENTERO.

═══════════════════════════════════════════
## 9. EMERGENCIAS Y TRUCOS APRENDIDOS
═══════════════════════════════════════════

- TIMEOUTS de instalación (brew etc.): no sufras → tú ejecutas el
  comando en tu Terminal y le dices "hecho, sigue". Trabajo en
  equipo: la IA no espera, el humano no mecaniza.
- El agente se atasca → NO lo salves de inmediato: sus protocolos de
  recuperación necesitan oportunidad de trabajar. Los fallos bajo
  presión son informativos.
- "Failed to fetch" en web local → ahora siempre responde algo el
  servidor: mira el log de la consola.
- UI web con bugs de renderizado → los tests de API NO los ven:
  tu tour es el único detector. Los bugs viven entre "el código
  está" y "el código funciona".
- Botones en formularios HTML → deben llevar type="button" o son
  submit por defecto y mueren en silencio (bug real de habitos).
- Cuando propone algo que rompe el espíritu → te lo dirá él mismo
  ("rompe D1") — déjale razonar, confirma conscientemente.
- Tarea abierta ("mejóralo") → buen examen: los buenos agentes
  eligen poco y descartan mucho CON RAZONES.
- las apps de IA (Chatbox incluida) pueden inyectar coautoría en
 los mensajes de commit. Se quita con reescritura de mensajes 
 (git filter-branch --msg-filter) y se previene verificando 
 git log -1 tras cada commit del agente.

═══════════════════════════════════════════
## 10. CHEAT SHEET DE FRASES (copiar y pegar)
═══════════════════════════════════════════

Delegar stack:      "No, elige tú y explícame brevemente por qué."
Confirmar plan:     "Adelante con autonomía completa."
Confirmar propuesta:"Confirmado todo según tus votos. Adelante."
Pedir propuesta:    "Antes de construir, preséntame la propuesta."
Pedir commit:       "Haz el commit con mensaje coherente según las
                     convenciones del proyecto."
Pedir auditoría:    "Revisa con lupa [X] línea a línea, corrige y
                     protege con tests anti-regresión."
Rotar chat:         (chat nuevo + boot card worker + worker.md +
                     "EMPEZAR" + chequeo de salud de §3)
Recordar versión:   bugfix = vX.Y.Z+1 sin hito; hito = vX.(Y+1).0
                     (según la convención D12 que él documente)

═══════════════════════════════════════════
## 11. LAS 10 REGLAS DURAS (por si necesitas recordar el espíritu)
═════════════════════════════  ===============
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
