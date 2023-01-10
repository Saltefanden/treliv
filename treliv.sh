#! /bin/bash
oldps1=$PS1
# declare -xi liv=3
#\[\e]0;\u@\h: \w\a\]\[\033[05;31m\][\[\033[00m\]\[\033[02;37m\]\u \A\[\033[00m\]\[\033[05;31m\]]\[\033[00m\] \[\033[02;36m\]\w/\[\033[00m\]$
c_normal=$'\e[00m'
c_red=$'\e[31m'
c_red_blinking=$'\e[05;31m'
c_red_dim=$'\e[02;31m'
hjerte=$'\u2665'


ftreliv(){
  local outstatus=$?
  # if [ -z ${liv+x} ]; then echo "liv is unset"; else echo "liv is set to '$liv'"; fi 
  if [[ -z ${liv+x} ]] # Liv is not set
  then
    liv=3
    # >&2 echo "Initialising liv to: " $liv
  else
    # >&2 echo "Liv is set to " $liv
  fi
  if [[ $outstatus -ne 0 ]] # You made an error
  then
    if [[ $liv -gt 1 ]] # You still have lifes left
    then
      liv=$((liv-1))

      echo -n $c_red

      for (( i=0; i < $liv; i++ )) 
      do 
        echo -n $hjerte 
      done
      
      echo -n $c_red_blinking$hjerte
      echo -n $c_red_dim

      for (( i=(($liv+1)); i < 3; i++ )) 
      do 
        echo -n $hjerte 
      done

      echo -n $c_normal 

    else # You are dead
      echo ' __   __                                 _                _ '
      echo ' \ \ / /__  _   _    __ _ _ __ ___    __| | ___  __ _  __| |'
      echo '  \ V / _ \| | | |  / _` | `__/ _ \  / _` |/ _ \/ _` |/ _` |'
      echo '   | | (_) | |_| | | (_| | | |  __/ | (_| |  __/ (_| | (_| |'
      echo '   |_|\___/ \__,_|  \__,_|_|  \___|  \__,_|\___|\__,_|\__,_|'
      echo 
      # ☠☠☠☠☠
      sleep 1
      unset PROMPT_COMMAND liv
      exit
    fi
  else # No errors
    echo -n $c_red

    for (( i=0; i < $liv; i++ )) 
    do 
      echo -n $hjerte 
    done

    echo -n $c_red_dim

    for (( i=$liv; i < 3; i++ )) 
    do 
      echo -n $hjerte 
    done

    echo -n $c_normal 
  fi
}

PROMPT_COMMAND=ftreliv
# PS1=$c_red$hjerte$hjerte$hjerte$c_normal$oldps1
# PS1="\$(ftreliv)"$oldps1
# unset hjerte c_red c_normal c_red_dim c_red_blinking
