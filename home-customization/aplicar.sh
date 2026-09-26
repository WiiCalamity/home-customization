#!/bin/bash

# Esse arquivo aplicará ao Cinnamon os parâmetros salvos em config.sh.
# Talvez você queira dar uma olhada lá dentro.

source config.sh

###########
# Install #
###########

mkdir -p "${HOME}"/.themes
mkdir -p "${HOME}"/.icons
mkdir -p "${HOME}"/.fonts
mkdir -p "${HOME}"/.local/share/wallpapers
mkdir -p "${HOME}"/.local/share/cinnamon/extensions
mkdir -p "${HOME}"/.config/cinnamon/spices

cp -ru "${gtkThemesDir}"/\* "${HOME}"/.themes
cp -ru "${iconThemesDir}"/\* "${HOME}"/.icons
cp -ru "${cursorsDir}"/\* "${HOME}"/.icons
cp -ru "${fontsDir}"/\* "${HOME}"/.fonts
cp -ru "${wallpapersDir}"/\* "${HOME}"/.local/share/wallpapers
cp -ru "${extensionsDir}"/\* "${HOME}"/.local/share/cinnamon/extensions
cp -ru "${extensionsConfigDir}"/\* "${HOME}"/.config/cinnamon/spices

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
if [[ ${shouldApplyExtensions} = "True" ]]; then
        gsettings set org.cinnamon enabled-extensions "${enabledExtensions}"
fi
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
