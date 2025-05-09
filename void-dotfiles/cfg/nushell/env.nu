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
    BUN_INSTALL_CACHE_DIR: ($env.XDG_CACHE_HOME | path join "bun" "install" "cache")
}}
# =============================================================================== #
#  FZF:                                                                           #
# =============================================================================== #
$env.FZF_DEFAULT_OPTS = "
--input-border --style=full
--height=40% --border --layout reverse
--preview-window right,80%
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
