#!/bin/sh
# Genera la edición pública a partir de index.html (edición pro).
# Uso: sh make_publica.sh   -> crea la carpeta publica/ con index.html y sw.js
set -e
mkdir -p publica
sed "s/^const EDITION='pro';/const EDITION='publica';/" index.html > publica/index.html
sed "s/scouting-v/scouting-pub-v/" sw.js > publica/sw.js
for f in manifest.webmanifest icon-180.png icon-192.png icon-512.png; do [ -f "$f" ] && cp "$f" publica/; done
echo "Listo: publica/ (sube esta carpeta a la dirección de la edición pública)"
