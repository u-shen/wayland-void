# =============================================================================== #
# Alias :                                                                         #
# =============================================================================== #
# Changing "ls" to "eza"
alias ls = eza --long --group --icons=auto --git --sort=name --group-directories-first
alias ll = eza --long --group --icons=auto --git --sort=name --group-directories-first
alias lt = eza --long --group --icons=auto --git --only-dirs --tree --level=3 --sort=modified
# Changing Directory
alias cd.. = cd ..
alias cdd = cd D:/
alias cdc = cd C:/
# Fetch (System Info)
alias fetch = fastfetch
alias neofetch = fastfetch
# NeoVim To Vim
alias v = nvim
alias vi = nvim
alias nv = nvim
alias vn = nvim
alias vm = nvim
alias vim = nvim
alias vd = nohup neovide 2>/dev/null 1>&2 &
alias nd = nohup neovide 2>/dev/null 1>&2 &
# Github Command
alias g = git
alias gi = git init
alias gs = g status -s
alias ga = g add --all
alias gcl = g clone --depth=1
alias gc = g commit -m
alias gd = g diff
alias gl = g log --oneline --graph --all -10
alias gp = g push -uf origin main
alias lg = lazygit
# winget Package Manager
alias pu = doas xbps-install -Su
alias pi = doas xbps-install -S
alias pr = doas xbps-remove -R
alias pq = xbps-query -Rs
alias pl = xbps-query -l
alias pclean = doas rm -rf /var/cache/xbps/*
# BUN Package Manager
alias buna = bun add
alias bunr = bun remove
alias bunu = bun update
alias buni = bun install
alias bun-run = bun run
alias bun-dev = bun --bun run dev
## For Configs Files
alias sucks = cd ~/.local/wayland-void/void-dotfiles/cfg/wayland-suckless/
alias dots = cd ~/.local/wayland-void/
alias nvimc = nvim ~/.config/nvim/init.lua
alias riverc = nvim ~/.config/river/init
alias swayc = nvim ~/.config/sway/config
alias footc = nvim ~/.config/foot/foot.ini
alias bashc = nvim ~/.bashrc
alias starc = nvim ~/.config/starship.toml
alias code = flatpak run com.visualstudio.code
# Others Usfeual Alias
alias yt-concats = yt-dlp --ignore-config --downloader aria2c --output "~/Videos/PROGRAMMING/%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --format "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" --concat-playlist always
alias yt-music = yt-dlp --ignore-config --config-locations ~/.config/yt-dlp/music
alias man = tldr
alias cat = bat
alias htop = ntop -u LLI -s CPU%
alias cls = clear
alias chrome = start chrome
alias firefox = start firefox
alias zen = start zen
