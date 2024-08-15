#!/bin/sh
sudo xbps-install -Sy \
    # DRIVERS:
    mesa-dri vulkan-loader mesa-vulkan-intel intel-video-accel \
    # SYSTEM:
    base-devel elogind \
    # VOID:
    xtools \
    # TERMINAL:
    foot wezterm \
    # COMPILE:
    ninja meson pkg-config cairo cairo-devel pango pango-devel fcft fcft-devel \
    # COMPOSITOR:
    wayland wayland-protocols xorg-server-xwayland wlroots wlroots-devel \
    pkg-config libxkbcommon libxkbcommon-devel libevdev libevdev-devel pixman pixman-devel \
    # COMPOSITOR-TOOLS:
    fuzzel wmenu wvkbd hyprpicker wbg SwayNotificationCenter swaylock swayidle \
    # WAYLAND QT APP:
    qt5ct qt5-wayland qt6-wayland \
    # SCREENSHOOT TOOLS:
    grim slurp swappy \
    # SCREENSHARING TOOLS:
    obs wf-recorder xdg-desktop-portal-wlr \
    # COMMAND LINE TOOLS:
    xdg-user-dirs xdg-utils psmisc bash-completion opendoas btop \
    fastfetch nnn yt-dlp aria2 ffmpeg libsixel-util rsync eza bat glow starship wl-clipboard trash-cli tealdeer man-db \
    neovim lazygit cava fzf fd ripgrep zoxide pastel delta curl jq brightnessctl ImageMagick \
    # Graphical TOOLS:
    mpv vimiv zathura zathura-pdf-mupdf \
    chromium qutebrowser firefox libreoffice nemo mypaint gimp \
    kvantum flatpak \
    # STORAGE TOOLS:
    gptfdisk parted gparted udiskie simple-mtpfs \
    gvfs gvfs-mtp gvfs-smb gvfs-afc gvfs-gphoto2 \
    # NETWORKING TOOLS:
    NetworkManager network-manager-applet linux-wifi-hotspot \
    net-tools wireless_tools bind-utils iputils inetutils-telnet \
    # SOUNDS TOOLS:
    pipewire wireplumber alsa-pipewire alsa-utils pavucontrol \
    # BLUETOOTHS TOOLS
    bluez bluez-alsa libspa-bluetooth blueman \
    # PROGRAMMING LANGUAGE:
    nodejs python3 python3-pip python3-devel \
    # FONTS:
    noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-emoji \
    font-awesome dejavu-fonts-ttf \
