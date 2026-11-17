# LEDGER DE ERRORES — Sistema v2.0

Cada escape del sistema (bug que ningún check cazó) se registra aquí y se convierte en check mecánico o mecanismo nuevo. Una entrada nunca se borra ni se edita históricamente: se corrige in-place solo si contiene un error factual, y las correcciones se declaran.

Fuente autoritativa de entradas. El mecanismo (cuándo consultar, cómo convertir en check) se documenta en el Manual v2.

---

## Entrada 1 — Merge prematuro de main desde la web

- **Fecha del escape:** 2026-11-16 21:52:53 +0100 (detectado 2026-11-17 por la mañana, huso +0100, en la verificación pre-F2 de esta construcción — sin timestamp propio exacto: la detección no ejecutó `date` en ese lote, lección aplicada)
- **Qué coló:** un humano mergeó la rama v2.0 (en estado parcial: F0 + 1 skill de 12) a main desde la web de GitHub — banner "Compare & pull request", PR #1, cuenta BilboDev — sin que ningún mecanismo del sistema lo impidiera.
- **Qué regla existía y no lo paró:** ninguna. El control era solo de proceso ("el merge de main es decisión exclusiva del dueño al final de F6"): sin diente mecánico en el repo y sin protección de rama en GitHub.
- **Lección:** el botón verde del banner fusiona de verdad; el merge de main es ceremonia exclusiva de F6.
- **Resolución:** restauración de main a `cc3de3f` con `git push --force-with-lease=refs/heads/main:87929ed` (autorización explícita del dueño, Opción A). PR #1 queda como cicatriz aceptada en el historial de GitHub. Pérdida: cero — todo el contenido del merge vivía íntegro en la rama v2.0 (verificado: `ad6cc04` es ancestro de `58a51e3`).
- **Mecanismo convertido:**
  1. Verificación `git ls-remote origin main` contra el commit esperado al ABRIR cada fase — práctica obligatoria desde ya en esta construcción.
  2. Recomendación al dueño (solo él puede activarla): branch protection en main en GitHub (require PR + revisión; desactiva el merge de un clic desde el banner).
  3. El Manual v2 (F5) documentará la regla operativa del día-1-a-día: main se toca solo en F6.
