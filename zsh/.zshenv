if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export ZSH_AUTOSUGGEST_STRATEGY=(completion match_prev_cmd)

# Paths
# NPM
if [[ -z $IN_NIX_SHELL ]];then
    npm config set prefix ~/.npm
fi

path+=(
    # $HOME/.gem/ruby/2.7.0/bin
    $HOME/.local/bin
    $HOME/.npm/bin
    $HOME/bin
    $HOME/go/bin
    $path
)


source ~/.aliases

if [ -e /home/trey/.nix-profile/etc/profile.d/nix.sh ]; then . /home/trey/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
