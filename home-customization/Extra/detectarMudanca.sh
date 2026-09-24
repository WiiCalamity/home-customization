#!/bin/bash
# Salva estado atual, você faz a mudança na interface, e ele mostra o que mudou.
BEFORE=$(mktemp)
gsettings list-recursively > "$BEFORE"
printf "Faça a mudança na GUI e pressione <Enter>...\n"
read
AFTER=$(mktemp)
gsettings list-recursively > "$AFTER"
diff -u "$BEFORE" "$AFTER"

# Copiado de:
# https://paxa.dev/posts/gnome-cheatsheet
