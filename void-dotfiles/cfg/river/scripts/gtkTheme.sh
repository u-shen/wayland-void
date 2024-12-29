#!/bin/sh

## Set GTK Themes, Icons, Cursor and Fonts
THEME='Gruvbox-Dark'
ICONS='Papirus-Dark'
FONT='JetBrainsMono NF 10'
CURSOR='Bibata-Modern-Classic'
SCHEMA='gsettings set org.gnome.desktop.interface'

apply_themes() {
  ${SCHEMA} gtk-theme "$THEME"
  ${SCHEMA} icon-theme "$ICONS"
  ${SCHEMA} cursor-theme "$CURSOR"
  ${SCHEMA} font-name "$FONT"
  ${SCHEMA} color-scheme "prefer-dark"
}

apply_themes
