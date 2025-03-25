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
    xdg-user-dirs xdg-utils psmisc bash-completion opendoas htop \
    fastfetch yazi yt-dlp aria2 ffmpeg chafa libsixel-util rsync eza bat glow starship wl-clipboard trash-cli tealdeer man-db \
    neovim lazygit fzf fd ripgrep zoxide pastel delta curl jq brightnessctl ImageMagick \
    # Graphical TOOLS:
    mpv imv zathura zathura-pdf-mupdf \
    chromium firefox thunderbird pcmanfm gimp shotcut \
    kvantum \
    # STORAGE TOOLS:
    gptfdisk parted gparted udiskie simple-mtpfs \
    gvfs gvfs-mtp gvfs-smb gvfs-afc gvfs-gphoto2 \
    # NETWORKING TOOLS:
    NetworkManager network-manager-applet linux-wifi-hotspot \
    net-tools wireless_tools bind-utils iputils inetutils-telnet ethtool \
    # SCHEDULE & TASK TOOLS:
    at cronie \
    # TIME DATE PROTOCOOLS (NTP)
    tzutils chrony \
    # WAYLAND QT Tools:
    qt5ct qt5-wayland qt6-wayland \
    # SOUNDS TOOLS:
    pipewire wireplumber alsa-pipewire alsa-utils pamixer pavucontrol \
    # BLUETOOTHS TOOLS
    bluez bluez-alsa libspa-bluetooth blueman \
    # PROGRAMMING LANGUAGE:
    nodejs python3 python3-pip python3-devel \
    # LSP:
    lua-language-server \
    # FONTS:
    noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-cjk-sans noto-fonts-emoji \
    font-awesome dejavu-fonts-ttf \
    # theme
    gtk-engine-murrine breeze-hacked-cursor-theme papirus-icon-theme
