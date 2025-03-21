####################################
####---------- WAYLAND ----------###
####################################
export GDK_BACKEND=wayland
export XDG_SESSION_TYPE=wayland
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QUTE_QT_WRAPPER=PyQt6
export QT_SCALE_FACTOR_ROUNDING_POLICY=RoundPreferFloor
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=1
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export WLR_NO_HARDWARE_CURSORS=1
export MOZ_ENABLE_WAYLAND=1
export XCURSOR_THEME=Breez_Hacked

####################################
####---------- EXPORTS ----------###
####################################
export HISTFILESIZE=5000
export HISTCONTROL=ignoreboth:erasedups
export TERMINAL="foot"
export BROWSER="firefox"
export PAGER="less"
export EDITOR="nvim"
export VISUAL="nvim"
export MYVIMRC="$HOME/.config/nvim/init.lua"

#####################################
####-------- ~/Clean-Up: --------###
#####################################
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export UNISON="$XDG_DATA_HOME/unison"
export HISTFILE="$XDG_CACHE_HOME/history"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export IPYTHONDIR="$HOME/.cache/ipython_config"
export JUPYTER_CONFIG_DIR="$HOME/.cache/jupyter_config"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/rc"
export XDEB_PKGROOT=${HOME}/.config/xdeb

#####################################
###--------- SHELL OPTIONS -------###
#####################################
set -o vi
shopt -s cdable_vars
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s dotglob
shopt -s extglob
shopt -s no_empty_cmd_completion
shopt -s nocaseglob
shopt -s histappend

#####################################
###------------ PROMPT -----------###
#####################################
eval "$(starship init bash)"

#####################################
###------------ ZOXIDE -----------###
#####################################
eval "$(zoxide init bash)"

#####################################
###------------ ALIASES ----------###
#####################################
# Changing "ls" to "eza"
alias ls="eza --long --group --icons=auto --git --sort=name --group-directories-first"
alias ll="eza --long --group --icons=auto --git --sort=name --group-directories-first"
alias lt="eza --long --group --icons=auto --git --only-dirs --tree --level=3 --sort=modified"
# Cd To Zoxide
alias cd="z"
alias cdf="zi"
# Fetch (System Info)
alias fetch="fastfetch"
alias neofetch="fastfetch"
## NeoVim To Vim
alias v="nvim"
alias vi="nvim"
alias nv="nvim"
alias vn="nvim"
alias vim="nvim"
alias vid="nohup neovide 2>/dev/null 1>&2 &"
alias nvd="nohup neovide 2>/dev/null 1>&2 &"
# Github Command
alias g="git"
alias gi="git init"
alias gs="g status -s"
alias ga="g add --all"
alias gcl="g clone --depth=1"
alias gc="g commit -m"
alias gd="g diff"
alias gl="g log --oneline --graph --all -10"
alias gp="g push -uf origin main"
alias lg="lazygit"
# Img Viewr libsixel
alias sx="img2sixel --width=40% --height=30%"
alias sxl="lsix"
alias sxg="vimiv --recursive"
## Xbps Pkg Manager
alias pu="doas xbps-install -Syu xbps && doas xbps-install -Su"
alias pi="doas xbps-install -S"
alias pr="doas xbps-remove -R"
alias pq="xbps-query -Rs"
alias pl="xbps-query -l"
alias pclean="doas rm -rf /var/cache/xbps/*"
## Flatpak PKG Manager
alias flat-update="flatpak update -y"
alias flat-install="flatpak install -y --or-update flathub"
alias flat-remove="flatpak uninstall -y --force-remove --delete-data --noninteractive"
alias flat-orphans-remove="flatpak uninstall -y --unused --noninteractive"
alias flat-all-remove="flatpak uninstall -y --all --delete-data --noninteractive"
## Power Management
alias poweroff="doas poweroff"
alias shutdown="doas shutdown"
alias reboot="doas reboot"
alias zzz="doas zzz"
## For Configs Files
alias recompile="cd ~/.local/wayland-void/void-dotfiles/cfg/wayland-suckless/dwl && doas make clean install"
alias sucks="cd ~/.local/wayland-void/void-dotfiles/cfg/wayland-suckless/"
alias dots="cd ~/.local/wayland-void/"
alias nvimc="nvim ~/.config/nvim/init.lua"
alias riverc="nvim ~/.config/river/init"
alias swayc="nvim ~/.config/sway/config"
alias footc="nvim ~/.config/foot/foot.ini"
alias bashc="nvim ~/.bashrc"
alias starc="nvim ~/.config/starship.toml"
alias code='flatpak run com.visualstudio.code'
alias act='source ~/vids/3_PYTHON/LEARN-VENV/bin/activate && cd ~/vids/3_PYTHON/BOOK/ && jupyter notebook'
# Others Usfeual Alias
alias yt-concats='yt-dlp --concat-playlist always -S "codec:h264"'
alias yt-music='yt-dlp --ignore-config --config-locations ~/.config/yt-dlp/music'
alias man="tldr"
alias cat="bat"
alias cls="clear"
#####################################
###-----Source fzf keybindingd----###
#####################################
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS="--height=40% --border --multi --info inline-right --layout reverse --marker ▏ --pointer ▌ --prompt '▌ ' --highlight-line --color gutter:-1,selected-bg:238,selected-fg:146,current-fg:189"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --no-hidden --strip-cwd-prefix --exclude .git"
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
alias run_in_nvim="fzf --multi --bind 'enter:become(nvim {+})'"
alias run_in_mpv="fd 'mp4' | fzf --multi --bind 'enter:become(mpv {+})'"
alias run_in_yazi="fd -t d | fzf --bind 'enter:become(yazi {+})'"
bind '"\C-v":"run_in_nvim\n"'
bind '"\C-p":"run_in_mpv\n"'
bind '"\C-n":"run_in_yazi\n"'
#####################################
###-------Tab Completions --------###
#####################################
# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'
# Display a list of the matching files
bind "set show-all-if-ambiguous off"
# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"
# Ignore Hidden Files
bind 'set match-hidden-files off'
#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#####################################
###---------- System Path  -------###
#####################################
NPM_PACKAGES="${HOME}/.local/share/npm-packages"
export PATH="$HOME/.config/bin:$HOME/.config/bin/nvim/bin/:$HOME/.cargo/bin:$HOME/.local/bin:$NPM_PACKAGES/bin:$PATH"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
