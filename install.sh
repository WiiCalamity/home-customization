#!/bin/bash
#############
# Variables #
#############

customStuffDirectory="custom"
homeDirectory="${HOME}"

panelPosition="top"
panelHeight="47"

# Files in custom/.fonts
fontName="SF Pro Text"
fontSize="9"

# Files in custom/.icons
iconTheme="breeze-chameleon-dark"

# Files in custom/.themes
gtkTheme="Skeuos-Blue-Dark"

# Files in custom/.local/share/wallpapers
wallpaper="wp12568410-night-mountains-4k-wallpapers.jpg"

# Files in custom/.icons
cursor="Bibata-Modern-Classic"

# Files in custom/.local/share/cinnamon/extensions
enabledExtensions="['watermark@germanfr', 'mouse-shake-zoom@rcalixte', 'dim-inactive-windows@jark', 'compiz-windows-effect@hermes83.github.com', 'BlurCinnamon@klangman']"

# Usar o detect.sh para modificar esse aqui
panelApplets="['panel1:left:0:menu@cinnamon.org:0', 'panel1:right:4:systray@cinnamon.org:3', 'panel1:right:8:removable-drives@cinnamon.org:7', 'panel1:right:9:keyboard@cinnamon.org:8', 'panel1:right:11:network@cinnamon.org:10', 'panel1:right:12:sound@cinnamon.org:11', 'panel1:right:14:calendar@cinnamon.org:13', 'panel1:left:1:panel-launchers@cinnamon.org:15', 'panel1:center:0:window-list@cinnamon.org:16', 'panel1:right:1:xrandr@cinnamon.org:17', 'panel1:left:2:show-desktop@cinnamon.org:18']"


###########
# Install #
###########

cd "${customStuffDirectory}"

cp --recursive --verbose --update . "${homeDirectory}" # "." significa "diretório atual" (custom)
# -n => --never-overwrite; -d => --target-directory
unzip -n ./.icons/\*.zip -d "${homeDirectory}"/.icons/
unzip -n ./.themes/\*.zip -d "${homeDirectory}"/.themes/
unzip -n ./.fonts/\*.zip -d "${homeDirectory}"/.fonts/

echo "Installed!"


#########
# Apply #
#########

# General theme
printf "Debug: Applying general theme"
gsettings set org.cinnamon.desktop.interface icon-theme "${iconTheme}"
gsettings set org.cinnamon.desktop.interface gtk-theme "${gtkTheme}"
gsettings set org.cinnamon.theme name "${gtkTheme}"
gsettings set org.cinnamon.desktop.interface cursor-theme "${cursor}"
gsettings set org.cinnamon.desktop.background picture-uri file://"${homeDirectory}"/.local/share/wallpapers/"${wallpaper}"
gsettings set org.cinnamon.desktop.interface font-name "${fontName} ${fontSize}"
gsettings set org.nemo.desktop font "${fontName} ${fontSize}"

# Behavior
printf "Debug: Applying desktop behavior"
gsettings set org.cinnamon enabled-extensions "${enabledExtensions}"
gsettings set org.cinnamon.desktop.wm.preferences focus-mode 'sloppy'
gsettings set org.cinnamon.desktop.wm.preferences resize-with-right-button true

# Panel
printf "Debug: Applying panel modifications"
gsettings set org.cinnamon panels-height "['1:${panelHeight}', '']" # 2nd is dummy
gsettings set org.cinnamon panels-enabled "['1:0:${panelPosition}', '']"
gsettings set org.cinnamon enabled-applets "${panelApplets}"

printf "Applied!"

########
# Exit #
########

printf "Done!"

exit
exit
