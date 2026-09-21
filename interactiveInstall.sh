#!/bin/bash

cd custom
BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
NORMAL=$(tput sgr0)

###########
# Prompts #
###########

myFiles=$(ls -1 .local/share/wallpapers)
printf "${BOLD}Escolha um papel de parede${NORMAL}\n"
printf "${myFiles}" | nl # nl: numerar linhas
read -p "Número: " opcao
wallpaper=$(printf "${myFiles}" | sed "${opcao}q;d")

gsettings set org.cinnamon.desktop.background picture-uri file://"${HOME}"/.local/share/wallpapers/"${wallpaper}"

exit
