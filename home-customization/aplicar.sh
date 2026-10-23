#!/bin/bash

# Esse arquivo aplicará ao Cinnamon as variáveis salvas em config.sh.
# Talvez você queira dar uma olhada lá dentro.

clear
printf "==============================================\n";
printf "               ___                      __   \n" 
printf "  ____ _____  / (_)________ ___________/ /_  \n";
printf " / __ \`/ __ \/ / / ___/ __ \`/ ___/ ___/ __ \ \n";
printf "/ /_/ / /_/ / / / /__/ /_/ / /  (__  ) / / / \n";
printf "\__,_/ .___/_/_/\___/\__,_/_(_)/____/_/ /_/  \n";
printf "    /_/                                      \n\n";
printf "==============================================\n\n";

source config.sh

###########
# Install #
###########

printf "Debug: creating directories on home directory\n"
mkdir -p "${HOME}"/.themes
mkdir -p "${HOME}"/.icons
mkdir -p "${HOME}"/.fonts
mkdir -p "${HOME}"/.local/share/wallpapers
mkdir -p "${HOME}"/.local/share/cinnamon/extensions
mkdir -p "${HOME}"/.config/cinnamon/spices

printf "Debug: copying files to home directory\n"
cp -ru "${gtkThemesDir}"/* "${HOME}"/.themes
cp -ru "${iconThemesDir}"/* "${HOME}"/.icons
cp -ru "${cursorsDir}"/* "${HOME}"/.icons
cp -ru "${fontsDir}"/* "${HOME}"/.fonts
cp -ru "${wallpapersDir}"/* "${HOME}"/.local/share/wallpapers
cp -ru "${extensionsDir}"/* "${HOME}"/.local/share/cinnamon/extensions
cp -ru "${extensionsConfigDir}"/* "${HOME}"/.config/cinnamon/spices

printf "Debug: unzipping stuff\n"
unzip -nq "${gtkThemesDir}"/\*.zip -d "${HOME}"/.themes/
unzip -nq "${iconThemesDir}"/\*.zip -d "${HOME}"/.icons/
unzip -nq "${cursorsDir}"/\*.zip -d "${HOME}"/.icons/
unzip -nq "${fontsDir}"/\*.zip -d "${HOME}"/.fonts/

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
gsettings set org.cinnamon.desktop.background picture-uri file://"${HOME}"/.local/share/wallpapers/"${wallpaper}"
gsettings set org.cinnamon.desktop.interface font-name "${fontName} ${fontSize}"
gsettings set org.nemo.desktop font "${fontName} ${fontSize}"

# Behavior
printf "Debug: Applying desktop behavior\n"
if [[ ${shouldApplyExtensions} != "False" ]]; then
        gsettings set org.cinnamon enabled-extensions "${enabledExtensions}"
fi
gsettings set org.cinnamon.desktop.wm.preferences focus-mode ${mouseFocusMode}
gsettings set org.cinnamon.desktop.wm.preferences resize-with-right-button ${altRightClickResizes}

# Panel
printf "Debug: Applying panel modifications\n"
cp -ru "${appletsDir}"/* "${HOME}"/.config/cinnamon/spices
gsettings set org.cinnamon panels-height "['1:${panelHeight}', '']" # 2nd is dummy
gsettings set org.cinnamon panels-enabled "['1:0:${panelPosition}', '']"
gsettings set org.cinnamon enabled-applets "${panelApplets}"

printf "Applied!\n"

########
# Exit #
########

printf "Done!\n"
exit
