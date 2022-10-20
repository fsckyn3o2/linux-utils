#!/bin/bash

# ELECOM HUGE configuration example
# Map button 9 (top side button) to button 2 (middle button)

mouse-xinput-configuration() {

  current_dir=`dirname $0`
  elecom_huge_id=$(xinput | grep "Mouse HUGE TrackBall.*pointer" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/')

  if [ elecom_huge_id == "" ];
  then

    echo "No device detected !"

  else
  
    echo "Device detected : Elecom HUGE TrackBall"
    # echo $elecom_huge_id > ~/.mouse-id
    xinput set-button-map $elecom_huge_id 2 2 11 4 5 5 4 3 1 8 9 12

    xbindkeys -f $current_dir/mouse-xbind-config-elecom-huge.cfg
    echo "Configured!"

  fi

}

mouse_reset_binding() {
  killall xbindkeys
  mouse-xinput-configuration()
}

