#!/bin/bash
# =============================================================================== #
# List Packages:                                                                  #
# =============================================================================== #
packages=(
    # PACKAGE MANAGER:                                                                #
    # =============================================================================== #
    "bun"
    "yarn"
    "pnpm"
    # LANGUAGE SERVER PROTOCOL:                                                       #
    # =============================================================================== #
    "typescript"
    "typescript-language-server"
    "vscode-langservers-extracted"
    "@olrtg/emmet-language-server"
    "@tailwindcss/language-server"
    "prettier"
)
# =============================================================================== #
# NPM Packages:                                                                   #
# =============================================================================== #
for package in "${packages[@]}"; do
    echo "Installing $package..."
    npm install -g "$package"
done
echo "Installation Of NPM Packages Is Complete!"
