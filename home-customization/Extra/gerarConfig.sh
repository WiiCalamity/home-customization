#!/bin/bash

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
"Ícones (cuidado para não escolher um cursor)"
"Cursor (cuidado para não escolher um tema de ícones)"
"Fonte do sistema"
"Tema das janelas"
)
promptExtra=(
"Tamanho da fonte (normal=10)"
"Posição do painel (up/down/left/right)"
"Altura do painel (normal=40)"
"Modo de foco do mouse (click/sloppy)"
"Alt+Mouse2 redimensiona janela (true/false)"
)

for ((i=0; i<${#pathToFiles[*]}; i+=1)); do
        #clear
        myFiles=$(ls -1 "${pathToFiles[${i}]}")
        numOfFiles=$(($(printf "${myFiles}" | wc --lines)+1))

        printf "${BOLD}${prompt[${i}]}\n(<Enter> = não alterar)${NORMAL}\n"
        printf "${myFiles}" | nl # nl: numerar linhas
        read -p "Número: " option

        if [[ ${option} -ge 1 ]] && [[ ${option} -le ${numOfFiles} ]]; then
                query+=($(printf "${myFiles}" | sed "${option}q;d"))
        else
                query+=("")
        fi
        printf "query: ${query[*]}\noption: ${option}\n"
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

read -p "EM TESTES -- Carregar extensões? (S/n): " shouldApplyExtensions
[[ shouldApplyExtensions != "n" ]] && shouldApplyExtensions="True"

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
[[ -n ${query[2]} ]] && cursor="${query[2]}"
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

# ESSE ARQUIVO FOI GERADO AUTOMATICAMENTE POR gerarConfig.sh.
# O config.sh original está disponível na pasta Extra.

# Edite esse arquivo manualmente para salvar a customização que você deseja.
# Alternativamente, execute o arquivo gerarConfig.sh localizado em Extra
# para uma experiência interativa.

# Arquivos em custom/.local/share/wallpapers
wallpaper=${d}${wallpaper}${d}

# Arquivos em custom/.icons
iconTheme=${d}${iconTheme}${d}

# Arquivos em custom/.icons
cursor=${d}${cursor}${d}

# Arquivos em custom/.fonts
fontName=${d}${fontName}${d}
fontSize=${d}${fontSize}${d}

# Arquivos em custom/.themes
gtkTheme=${d}${gtkTheme}${d}

customStuffDirectory=${d}custom${d}
homeDirectory=${d}${HOME}${d}

panelPosition=${d}${panelPosition}${d}
panelHeight=${d}${panelHeight}${d}

mouseFocusMode=${d}${mouseFocusMode}${d}
altRightClickResizes=${d}${altRightClickResizes}${d}

# Arquivos em custom/.local/share/cinnamon/extensions
enabledExtensions=${d}[${s}watermark@germanfr${s},${s}mouse-shake-zoom@rcalixte${s},
${s}dim-inactive-windows@jark${s},
${s}compiz-windows-effect@hermes83.github.com${s},${s}BlurCinnamon@klangman${s}]${d}

# Usar o detect.sh para modificar esse aqui
panelApplets=${d}[${s}panel1:left:0:menu@cinnamon.org:0${s},
${s}panel1:right:4:systray@cinnamon.org:3${s},
${s}panel1:right:8:removable-drives@cinnamon.org:7${s},
${s}panel1:right:9:keyboard@cinnamon.org:8${s},
${s}panel1:right:11:network@cinnamon.org:10${s}, ${s}panel1:right:12:sound@cinnamon.org:11${s},
${s}panel1:right:14:calendar@cinnamon.org:13${s},
${s}panel1:left:1:panel-launchers@cinnamon.org:15${s},
${s}panel1:center:0:window-list@cinnamon.org:16${s}, ${s}panel1:right:1:xrandr@cinnamon.org:17${s},
${s}panel1:left:2:show-desktop@cinnamon.org:18${s}]${d}
" > config.sh
printf "Arquivo de configuração gerado."
exit
