#!/bin/bash
# Salva estado atual, você faz a mudança na interface, e ele mostra o que mudou.
BEFORE="$(gsettings list-recursively)"
printf "Faça a mudança na GUI e pressione <Enter>...\n"
read
AFTER="$(gsettings list-recursively)"
diff -u "$BEFORE" "$AFTER"

# Copiado de:
# https://paxa.dev/posts/gnome-cheatsheet
