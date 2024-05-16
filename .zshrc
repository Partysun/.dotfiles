export ZSH="$HOME/.oh-my-zsh"
# We are using PURE Theme. Setup is below
ZSH_THEME=""

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

HIST_STAMPS="dd.mm.yyyy"
plugins=(git z)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin

alias lg='lazygit'
alias gs='git status'
alias lt='eza --tree --level=2'     
alias e='eza --git --icons --group --group-directories-first --sort=name'
alias l='eza -lh --no-user'
alias ll='e -lagh'
alias kubectl='k3s kubectl'
