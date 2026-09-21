#!/bin/bash
# Salva estado atual, você faz a mudança na GUI, e ele mostra o diff
BEFORE=$(mktemp)
gsettings list-recursively > "$BEFORE"
echo "Faça a mudança na GUI e pressione Enter..."
read
AFTER=$(mktemp)
gsettings list-recursively > "$AFTER"
diff -u "$BEFORE" "$AFTER"
#https://paxa.dev/posts/gnome-cheatsheet
