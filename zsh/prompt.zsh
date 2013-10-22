autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  /usr/bin/git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rvm_prompt(){
  if $(which rvm &> /dev/null)
  then
	  echo "%{$fg_bold[yellow]%}$(rvm tools identifier)%{$reset_color%}"
	else
	  echo ""
  fi
}

env(){
  if $(which virtualenv &> /dev/null) 
  then
    if [ $VIRTUAL_ENV ]; then
      echo "<%{$fg_bold[yellow]%}${VIRTUAL_ENV##*/}%{$reset_color%}>" # last folder's name in a directory path
    else
      echo ""
    fi
    else
      echo ""
  fi
}

# This keeps the number of todos always available the right hand side of my
# command line. I filter it to only count those tagged as "+next", so it's more
# of a motivation to clear out the list.
todo(){
  if $(which $HOME/.todo/todo.sh &> /dev/null)
  then
    num=$(echo $($HOME/.todo/todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "$todos"
    else
      echo ""
    fi
  else
    echo ""
  fi
}

# Determine the time since last commit. If branch is clean,
# # use a neutral color, otherwise colors will vary according to time.
git_time_since_commit() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
      #
      if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
          #Get the last commit.
          last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
          now=`date +%s`
          seconds_since_last_commit=$((now-last_commit))
          
          #Totals
          MINUTES=$((seconds_since_last_commit / 60))
          HOURS=$((seconds_since_last_commit/3600))

          # Sub-hours and sub-minutes
          DAYS=$((seconds_since_last_commit / 86400))
          SUB_HOURS=$((HOURS % 24))
          SUB_MINUTES=$((MINUTES % 60))

          if [ "$HOURS" -gt 24 ]; then
            echo "${DAYS} d ${SUB_HOURS} h ${SUB_MINUTES} m %{$reset_color%}|"
          elif [ "$MINUTES" -gt 60 ]; then
            echo "${HOURS} h ${SUB_MINUTES} m%{$reset_color%}|"
          else
            echo "${MINUTES}m%{$reset_color%}|"
          fi
      else
          echo ""
      fi 
  fi
}

directory_name(){
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'\n$(env) in $(directory_name) $(git_dirty)$(need_push)\n› '
set_prompt () {
    export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
