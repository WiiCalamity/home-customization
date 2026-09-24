#!/bin/bash

# Só funciona nos computadores da escola... por enquanto.

# Restore applets
cp -r default/.config/* ${HOME}/.config/

# Restore general theme
gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-L'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-L'
gsettings set org.cinnamon.theme name 'Mint-L-Dark'
gsettings set org.cinnamon.desktop.interface cursor-theme 'DMZ-White'
gsettings set org.cinnamon.desktop.background picture-uri file://${HOME}/Imagens/montanhas_do_xp.jpg
gsettings set org.cinnamon.desktop.interface font-name 'Ubuntu 10'

# Restore behavior
gsettings set org.cinnamon enabled-extensions []
gsettings set org.cinnamon.desktop.wm.preferences focus-mode 'click'
gsettings set org.cinnamon.desktop.wm.preferences resize-with-right-button false

# Restore panel
gsettings set org.cinnamon panels-height "['1:40', '']"
gsettings set org.cinnamon panels-enabled "['1:0:bottom', '']"
gsettings set org.cinnamon enabled-applets "['panel1:left:0:menu@cinnamon.org:0', 'panel1:right:4:systray@cinnamon.org:3', 'panel1:right:8:removable-drives@cinnamon.org:7', 'panel1:right:9:keyboard@cinnamon.org:8', 'panel1:right:11:network@cinnamon.org:10', 'panel1:right:12:sound@cinnamon.org:11', 'panel1:right:14:calendar@cinnamon.org:13', 'panel1:left:1:panel-launchers@cinnamon.org:15', 'panel1:left:3:window-list@cinnamon.org:16', 'panel1:right:1:xrandr@cinnamon.org:17', 'panel1:left:2:show-desktop@cinnamon.org:18']"
