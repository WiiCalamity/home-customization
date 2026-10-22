#!/bin/bash

clear
printf "===========================================================================  \n"
printf "                               ______            _____              __       \n"
printf "   ____ ____  _________ ______/ ____/___  ____  / __(_)___ _  _____/ /_      \n"
printf "  / __ \`/ _ \/ ___/ __ \`/ ___/ /   / __ \/ __ \/ /_/ / __ \`/ / ___/ __ \  \n"
printf " / /_/ /  __/ /  / /_/ / /  / /___/ /_/ / / / / __/ / /_/ / (__  ) / / /     \n"
printf " \__, /\___/_/   \__,_/_/   \____/\____/_/ /_/_/ /_/\__, (_)____/_/ /_/      \n"
printf "/____/                                             /____/                    \n"
printf "===========================================================================  \n\n"


removeFileExtension() {
        printf "${1%.*}"
}

listNumbered() {
        printf "${1}" | nl
}

cd ..
source config.sh

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

declare -a query
pathToFiles=(
"custom/.local/share/wallpapers"
"custom/.icons"
"custom/.icons"
"custom/.fonts"
"custom/.themes"
)
prompt=(
"Papel de Parede"
"Ícones"
"Cursor"
"Fonte do sistema"
"Tema das janelas"
)
promptExtra=(
"Tamanho da fonte (normal=10)"
"Posição do painel (top/bottom/left/right)"
"Altura do painel (normal=40)"
"Modo de foco do mouse (click/sloppy)"
"Alt+Mouse2 redimensiona janela (true/false)"
)

for ((i=0; i<${#pathToFiles[*]}; i+=1)); do
        fileNames=$(ls -1 "${pathToFiles[${i}]}")
        numOfFiles=$(($(printf "${fileNames}" | wc --lines)+1))

        printf "${BOLD}${prompt[${i}]}\n(<Enter> = não alterar)${NORMAL}\n"
        printf "${fileNames}" | nl # nl: numerar linhas
        read -p "Número: " option

        if [[ ${option} -ge 1 ]] && [[ ${option} -le ${numOfFiles} ]]; then
                query+=($(printf "${fileNames}" | sed "${option}q;d"))
        else
                query+=("")
        fi
        printf "\n"
done

clear
read -p "Modificar configurações extras? (s/N): " option
if [[ ${option} = "s" ]]; then
        for ((i=0; i<${#promptExtra[*]}; i+=1)); do
                read -p "${promptExtra[${i}]}: " option
                if [[ -n ${option} ]]; then
                        query+=(${option})
                else
                        query+=("")
                fi
        done
fi

read -p "Carregar extensões? (S/n): " option
shouldApplyExtensions="True"
if [[ ${option} = "n" ]]; then
        shouldApplyExtensions="False"
fi

clear
for ((i=0; i<${#query[*]}; i+=1)); do
    printf "[${i}] ${query[${i}]}"
    [[ -z ${query[${i}]} ]] && printf "[não alterar]"
    printf "\n"
done
read -p "Está correto? (S/n): " option
[[ ${option} = "n" ]] && printf "Cancelado." && exit

[[ -n ${query[0]} ]] && wallpaper="${query[0]}"
[[ -n ${query[1]} ]] && iconTheme="${query[1]}"
[[ -n ${query[2]} ]] && cursor="$(removeFileExtension ${query[2]})"
[[ -n ${query[3]} ]] && fontName="${query[3]}"
[[ -n ${query[4]} ]] && gtkTheme="${query[4]}"
[[ -n ${query[5]} ]] && fontSize="${query[5]}"
[[ -n ${query[6]} ]] && panelPosition="${query[6]}"
[[ -n ${query[7]} ]] && panelHeight="${query[7]}"
[[ -n ${query[8]} ]] && mouseFocusMode="${query[8]}"
[[ -n ${query[9]} ]] && altRightClickResizes="${query[9]}"

d=\"
s=\'
printf "\
#!/bin/bash

# Edite esse arquivo manualmente para salvar a customização que você deseja.
# Alternativamente, execute o arquivo gerarConfig.sh localizado em Extra
# para uma experiência interativa.

# ESSE ARQUIVO FOI GERADO AUTOMATICAMENTE POR gerarConfig.sh.
# O config.sh original está disponível na pasta Extra.

gtkThemesDir=${d}./Customizacao/Temas${d}
iconThemesDir=${d}./Customizacao/Icones${d}
cursorsDir=${d}./Customizacao/Cursores${d}
fontsDir=${d}./Customizacao/Fontes${d}
wallpapersDir=${d}./Customizacao/Wallpaper${d}
extensionsDir=${d}./Customizacao/Extensoes${d}
extensionsConfigDir=${d}./Customizacao/Extensoes/Configuracoes${d}
appletsDir=${d}./Customizacao/Applets${d}

gtkTheme=${d}${gtkTheme}${d}

iconTheme=${d}b${iconTheme}${d}

cursor=${d}${cursor}${d}

fontName=${d}${fontName}${d}
fontSize=${d}${fontSize}${d}

wallpaper=${d}${wallpaper}${d}

panelPosition=${d}${panelPosition}${d}
panelHeight=${d}${panelHeight}${d}

mouseFocusMode=${d}${mouseFocusMode}${d}
altRightClickResizes=${d}${altRightClickResizes}${d}

enabledExtensions=${d}${enabledExtensions}${d}

# Usar o detect.sh para modificar esse aqui
enabledApplets=${d}${enabledApplets}${d}
" > testy.sh
printf "Arquivo de configuração gerado."
exit
