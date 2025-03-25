#!/bin/sh
sudo xbps-install -Sy \
    # SYSTEM:
    base-devel elogind xtools mesa-dri \
    # SHELL:
    alacritty \
    # COMPOSITOR:
    river sandbar waylock swayidle mako wmenu wlr-randr wvkbd wbg \
    # SCREENSHOOT TOOLS:
    grim slurp swappy \
    # SCREENSHARING TOOLS:
    obs xdg-desktop-portal-wlr \
    # COMMAND LINE TOOLS:
    xdg-user-dirs xdg-utils man-db opendoas trash-cli  htop aria2  ffmpeg ImageMagick \
    nnn fastfetch yt-dlp chafa rsync eza bat glow starship wl-clipboard tealdeer  \
    neovim lazygit fzf fd ripgrep zoxide pastel delta curl jq brightnessctl \
    # Graphical TOOLS:
    mpv imv zathura zathura-pdf-mupdf \
    chromium pcmanfm gimp shotcut \
    # STORAGE TOOLS:
    udiskie simple-mtpfs \
    gvfs gvfs-mtp gvfs-smb gvfs-afc gvfs-gphoto2 \
    # NETWORKING TOOLS:
    NetworkManager network-manager-applet linux-wifi-hotspot \
    net-tools wireless_tools bind-utils iputils inetutils-telnet \
    # WAYLAND QT Tools:
    qt5ct qt5-wayland qt6-wayland kvantum  \
    # SOUNDS TOOLS:
    pipewire wireplumber alsa-pipewire alsa-utils pamixer pavucontrol \
    # BLUETOOTHS TOOLS
    bluez bluez-alsa libspa-bluetooth blueman \
    # LANGUAGE TOOLS:
    nodejs lua-language-server  \
    # FONTS:
    noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-emoji \
    font-awesome dejavu-fonts-ttf \
    # theme
    gtk-engine-murrine breeze-hacked-cursor-theme papirus-icon-theme
