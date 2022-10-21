#!/bin/bash
export scriptsRegister+=("utils")

alias firefox-profile="firefox --profile /home/$HOME/firefox-profiles/$1"

compare_string_insensitive() {
  echo "$1" | grep -qi "^$2$" && echo "Strings are equal" || echo "String are NOT equal"
}

compare_date_month-day() {
  if [ "$1" == "--help" ]; then
      echo "Compare current date (<month>-<day>) with argument (<month>-<day>).\n\n\tIf arg date > current date then return 2\n\tElse if equals then return 1\n\tElse return 0\n"
      exit
  fi

  argMonth=${1:0:2}
  argDay=${1:3:2}
  currentMonth="`date +%m`"
  currentDay="`date +%d`"

  if [ "$argMonth-$argDay" == "$currentMonth-$currentDay" ]; then
    if [ "$2" == "--debug" ]; then
      echo "$argMonth-$argDay == $currentMonth-$currentDay"
    fi
    return 3
  elif [[ ($currentMonth -gt $argMonth) || ($currentMonth -eq $argMonth) && ($currentDay -gt $argDay) ]]; then
    if [ "$2" == "--debug" ]; then
      echo "$argMonth-$argDay < $currentMonth-$currentDay"
    fi
    return 1
  else
    if [ "$2" == "--debug" ]; then
      echo "$argMonth-$argDay > $currentMonth-$currentDay"
    fi
    return 2
  fi
}
