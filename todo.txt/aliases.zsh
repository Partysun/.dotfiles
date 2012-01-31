# todo.sh: https://github.com/ginatrapani/todo.txt-cli
function t() { 
  if [ $# -eq 0 ]; then
    $HOME/.todo/todo.sh ls
  else
    $HOME/.todo/todo.sh $*
  fi
}

alias n="t ls +next"
