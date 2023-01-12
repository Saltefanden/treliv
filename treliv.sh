#! /bin/bash

ftreliv(){
  local outstatus=$?

  c_normal=$'\e[00m'
  c_red=$'\e[31m'
  c_red_blinking=$'\e[05;31m'
  c_red_dim=$'\e[02;31m'
  hjerte=$'\u2665'

  if [[ -z ${liv+x} || $liv -gt 3 ]] # Liv is not set or set too big
  then
    liv=3
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
