#!/bin/bash

iconTheme="$(gsettings get org.cinnamon.desktop.interface icon-theme)"
gtkTheme="$(gsettings get org.cinnamon.desktop.interface gtk-theme)"
unknown1="$(gsettings get org.cinnamon.theme name)"
cursor="$(gsettings get org.cinnamon.desktop.interface cursor-theme)"
wallpaper="$(gsettings get org.cinnamon.desktop.background picture-uri)"
fontNameAndSize="$(gsettings get org.cinnamon.desktop.interface font-name)"
workspaceFontNameAndSize="$(gsettings get org.nemo.desktop font)"

enabledExtensions="$(gsettings get org.cinnamon enabled-extensions)"

mouseFocusMode="$(gsettings get org.cinnamon.desktop.wm.preferences focus-mode)"
altRightClickResizes="$(gsettings get org.cinnamon.desktop.wm.preferences resize-with-right-button)"

panelHeight="$(gsettings get org.cinnamon panels-height)"
panelPosition="$(gsettings get org.cinnamon panels-enabled)"
panelApplets="$(gsettings get org.cinnamon enabled-applets)"

printf "%s\n" "${iconTheme}" "${gtkTheme}" "${cursor}" "${enabledExtensions}"

