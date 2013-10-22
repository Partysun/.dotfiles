# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/.dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/Developer
export ANDROID_HOME=/opt/android-sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=/usr/local/share/python:$PATH
export HAXE_LIBRARY_PATH=/usr/lib/haxe/std:. 
export HAXE_HOME=/usr/lib/haxe
export PATH=$PATH:$HAXE_LIBRARY_PATH:$HAXE_HOME/bin
export PATH=/usr/local/bin:$PATH
#/usr/local/dev/eworkspace

# source every .zsh file in this rep
for config_file ($ZSH/**/*.zsh) source $config_file

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for config_file ($ZSH/**/completion.sh) source $config_file

# teamocil autocomplete
compctl -g '~/.teamocil/*(:t:r)' teamocil

# activate vim mode
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
