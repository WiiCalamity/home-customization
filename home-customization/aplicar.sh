#!/bin/bash

# Esse arquivo aplicará ao Cinnamon os parâmetros salvos em config.sh.
# Talvez você queira dar uma olhada lá dentro.

source config.sh

###########
# Install #
###########

cd "${customStuffDirectory}"

cp --recursive --verbose --update . "${homeDirectory}"
# -n => --never-overwrite; -d => --target-directory
unzip -n ./.icons/\*.zip -d "${homeDirectory}"/.icons/
unzip -n ./.themes/\*.zip -d "${homeDirectory}"/.themes/
unzip -n ./.fonts/\*.zip -d "${homeDirectory}"/.fonts/

printf "Installed!\n"


#########
# Apply #
#########

# General theme
printf "Debug: Applying general theme\n"
gsettings set org.cinnamon.desktop.interface icon-theme "${iconTheme}"
gsettings set org.cinnamon.desktop.interface gtk-theme "${gtkTheme}"
gsettings set org.cinnamon.theme name "${gtkTheme}"
gsettings set org.cinnamon.desktop.interface cursor-theme "${cursor}"
gsettings set org.cinnamon.desktop.background picture-uri file://"${homeDirectory}"/.local/share/wallpapers/"${wallpaper}"
gsettings set org.cinnamon.desktop.interface font-name "${fontName} ${fontSize}"
gsettings set org.nemo.desktop font "${fontName} ${fontSize}"

# Behavior
printf "Debug: Applying desktop behavior\n"
gsettings set org.cinnamon enabled-extensions "${enabledExtensions}"
gsettings set org.cinnamon.desktop.wm.preferences focus-mode ${mouseFocusMode}
gsettings set org.cinnamon.desktop.wm.preferences resize-with-right-button ${altRightClickResizes}

# Panel
printf "Debug: Applying panel modifications\n"
gsettings set org.cinnamon panels-height "['1:${panelHeight}', '']" # 2nd is dummy
gsettings set org.cinnamon panels-enabled "['1:0:${panelPosition}', '']"
gsettings set org.cinnamon enabled-applets "${panelApplets}"

printf "Applied!\n"

########
# Exit #
########

printf "Done!\n"
exit
