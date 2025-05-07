#!/bin/sh
# =============================================================================== #
# UI Settings:                                                                    #
# =============================================================================== #
## Set GTK Themes, Icons, Cursor and Fonts
THEME='paradise'
ICONS='Papirus-Dark'
FONT='JetBrainsMono NF 9'
CURSOR='Breeze_Hacked'
SCHEMA='gsettings set org.gnome.desktop.interface'

apply_themes() {
  ${SCHEMA} gtk-theme "$THEME"
  ${SCHEMA} icon-theme "$ICONS"
  ${SCHEMA} cursor-theme "$CURSOR"
  ${SCHEMA} font-name "$FONT"
  ${SCHEMA} color-scheme "prefer-dark"
}

apply_themes
