# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
alias brewup="brew update && brew doctor && brew outdated && brew upgrade && brew cleanup"
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi
