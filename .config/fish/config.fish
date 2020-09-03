
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# True color support for *nix system
set -x TERM xterm-256color

set -g theme_date_timezone Europe/Paris
set -g theme_date_format "+%a %d %b %Y %T"
set -g theme_display_k8s_namespace yes

# set -g theme_vcs_ignore_paths "$HOME" # Needs change in __bobthefish_ignore_vcs_dir

source ~/.profile
