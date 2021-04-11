export BROWSER='qutebrowser'
export GIT_EDITOR='nvim'
export EDITOR='nvim'
export VISUAL='nvim'
export LANG='en_US.UTF-8'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export PAGER='nvim -R' # git config --global pager.color no
export MANPAGER='nvim +Man!'

if (( $#commands[(i)lesspipe(|.sh)] )); then
    export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Paths
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
cdpath=(
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
    /usr/local/{bin,sbin}
    $path
)

# Setup nix
# source "$HOME/.nix-profile/etc/profile.d/nix.sh"

# Start x on login
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
exec startx
fi
