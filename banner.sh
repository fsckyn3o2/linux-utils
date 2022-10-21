#!/bin/bash

curdir="$( dirname -- "$0"; )"
if [ -z "$scriptsRegister" ]; then
  source "$curdir/utils.sh"
else
  export scriptsRegister
  if [[ "${scriptsRegister[*]}" =~ "utils" ]]; then
    source "$curdir/utils.sh"
  fi
fi

scriptsRegister+=("banner")

banner-event-msg() {
  # IFS is the 'internal field separator'. In this case, your file uses '='
  IFS="="
  while read -r key msg
  do
    IFS=".."
    read -ra dateRange <<< "${key}"

    compare_date_month-day "${dateRange[0]}"
    if [[ $? -eq 1 || $? -eq 3 ]]; then  # > or ==
      if [[ $? -eq 3 ]]; then
        echo "$msg"
      elif [ "${#dateRange[@]}" == "3" ]; then
        compare_date_month-day "${dateRange[2]}"
        if [[ $? -eq 2 || $? -eq 3 ]]; then  # < or ==
          echo "$msg"
        fi
      fi
    fi

    IFS="="
  done < "$curdir/_packages/banner/events.cfg"
  unset IFS
}

banner() {
  if [ "$1" == "--help" ]; then
      echo "[bannername] [--with-event]"
      echo "usage : banner [bannername] ,  bannername is filename contains in '_packages/banner'"
      echo "usage : banner [bannername] --with-usage , to display event message from _packages/events.cfg after the banner"
      exit
  fi

  if [ -f "$0/_packages/banner/$1.ascii" ]; then
    cat "$0/_packages/banner/$1.ascii"
  fi

  if [ "$2" == "--with-event" ]; then
    echo "---- Message ----"
    banner-event-msg
    echo "--------"
  fi
}

