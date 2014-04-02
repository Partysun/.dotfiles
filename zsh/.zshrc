# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/.dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/Developer
export ANDROID_HOME=/opt/android-sdk/
export ANDROID_NDK=/opt/android-ndk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_NDK
export PATH=/usr/local/share/python:$PATH
export HAXE_LIBRARY_PATH=/usr/lib/haxe/std:. 
export HAXE_HOME=/usr/lib/haxe
export PATH=$PATH:$HAXE_LIBRARY_PATH:$HAXE_HOME/bin
export PATH=/usr/local/bin:$PATH
#export PATH=/usr/local/share/python:$PATH
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

# set where virutal environments will live
export WORKON_HOME=$HOME/.virtualenvs
# ensure all new environments are isolated from the site-packages directory
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
    source /usr/local/share/python/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
