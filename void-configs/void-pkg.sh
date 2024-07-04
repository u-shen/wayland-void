#!/bin/sh
sudo xbps-install -Sy \
    # DRIVERS:
    mesa-dri vulkan-loader mesa-vulkan-intel intel-video-accel \
    # SYSTEM:
    base-devel elogind rsyslog logrotate \
    # VOID:
    void-repo-nonfree xtools \
    # TERMINAL:
    foot tmux wezterm \
    # COMPILE:
    ninja meson pkg-config cairo cairo-devel pango pango-devel fcft fcft-devel \
    # COMPOSITOR:
    wayland wayland-protocols xorg-server-xwayland wlroots wlroots-devel \
    pkg-config libxkbcommon libxkbcommon-devel libevdev libevdev-devel pixman pixman-devel \
    # COMPOSITOR-TOOLS:
    river Waybar lswt fuzzel wmenu kanshi wlr-randr wvkbd wbg SwayNotificationCenter swaylock swayidle \
    # WAYLAND QT APP:
    qt5ct qt5-wayland qt6-wayland \
    # SCREENSHOOT TOOLS:
    grim slurp swappy \
    # SCREENSHARING TOOLS:
    obs wf-recorder xdg-desktop-portal-wlr \
    # COMMAND LINE TOOLS:
    xdg-user-dirs xdg-utils psmisc acl-progs unrar bash-completion opendoas btop \
    fastfetch nnn moc yt-dlp aria2 ffmpeg libsixel-util rsync eza bat glow starship wl-clipboard trash-cli tealdeer man-db \
    neovim lazygit cava fzf fd ripgrep zoxide pastel delta curl jq brightnessctl ImageMagick \
    # Graphical TOOLS:
    mpv vimiv imv zathura zathura-pdf-mupdf \
    chromium qutebrowser firefox libreoffice nemo mypaint gimp \
    kvantum flatpak \
    # STORAGE TOOLS:
    gptfdisk parted gparted lvm2 udiskie simple-mtpfs \
    gvfs gvfs-mtp gvfs-smb gvfs-afc gvfs-gphoto2 \
    # NETWORKING TOOLS:
    NetworkManager network-manager-applet ufw linux-wifi-hotspot \
    net-tools wireless_tools bind-utils iputils inetutils-telnet ethtool tcpdump \
    # SCHEDULE & TASK TOOLS:
    at cronie \
    # TIME DATE PROTOCOOLS (NTP)
    tzutils chrony \
    # SERVERS & PRTOCOLS TOOLS:
    nfs-utils samba autofs apache \
    # SOUNDS TOOLS:
    pipewire wireplumber alsa-pipewire alsa-utils pamixer pavucontrol \
    # BLUETOOTHS TOOLS
    bluez bluez-alsa libspa-bluetooth blueman \
    # VIRTUALTION TOOLS:
    qemu libvirt virt-manager waydroid \
    # PROGRAMMING LANGUAGE:
    nodejs python3 python3-pip python3-devel rust go \
    # FONTS:
    noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-emoji noto-fonts-cjk \
    font-awesome dejavu-fonts-ttf \
