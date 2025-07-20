# =============================================================================== #
# Nushell General Env:                                                            #
# =============================================================================== #
$env.PATH = ($env.PATH | split row (char esep) | append "~/.config/bin/")
$env.SHELL = $nu.current-exe
$env.LANG = "en_US.utf-8"
$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.PAGER = "less"
$env.TERMINAL = "alacritty"
export-env { load-env {
    XDG_CONFIG_DIR: ($env.USERPROFILE | path join ".config")
    XDG_CACHE_HOME: ($env.USERPROFILE | path join ".cache")
    XDG_DOCUMENTS_DIR: ($env.USERPROFILE | path join "Documents")
    XDG_DOWNLOAD_DIR: ($env.USERPROFILE | path join "Downloads")
    XDG_MUSIC_DIR: ($env.USERPROFILE | path join "Music")
    XDG_PICTURES_DIR: ($env.USERPROFILE | path join "Pictures")
    XDG_VIDEOS_DIR: ($env.USERPROFILE | path join "Videos")
}}
export-env { load-env {
    RIPGREP_CONFIG_PATH : ($env.XDG_CONFIG_DIR | path join "ripgrep" "rc")
    BUN_INSTALL_CACHE_DIR: ($env.XDG_CACHE_HOME | path join "bun" "install" "cache")
}}
# =============================================================================== #
#  FZF:                                                                           #
# =============================================================================== #
$env.FZF_DEFAULT_OPTS = "
    --prompt='󱓇  ' --layout=reverse
    --preview-window=right,30%
    --style=minimal --height=30% --border --preview-window right,40%
    --color fg:#b3b9b8,bg:#141b1e
    --color bg+:#1e2527,fg+:#dadada
    --color hl:#8ccf7e,hl+:#8ccf7e,gutter:#141b1e
    --color pointer:#373d49,info:#606672
    --color border:#141b1e
    --color border:#8ccf7e
    --bind 'tab:accept'
"
# =============================================================================== #
#  carapace-bin:                                                                  #
# =============================================================================== #
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
# =============================================================================== #
#  Zoxide :                                                                       #
# =============================================================================== #
zoxide init nushell | save -f ~/.cache/zoxide.nu
