#!/bin/bash
export scriptsRegister+=("mouse-xinput-config-elecom-huge")

# ELEiCOM HUGE configuration : see mouse-evemu-config-elecom-huge.cfg

  current_dir=`dirname $0`
  file="${current_dir}/mouse-evemu-config-elecom-huge.cfg";

  mouseRemapDetect=()
  mouseRemapType=()
  mouseRemapKey=()

  # Load configuration file to 'mouseRemapCfg'
  line=0
  fileTxt=`cat $file`
  while IFS= read -r line; do
    
     IFS=" "
     read -r detected remap <<< $line

     IFS="-"
     read -r remap_type remap_key <<< $remap

     echo "detected : ${detected}, remap-type : ${remap_type}, remap-key : ${remap_key} ";

     IFS=" "
     mouseRemapDetect+=($detected);
     mouseRemapType+=($remap_type);
     mouseRemapKey+=($remap_key);


     line=line+1;
  done < $file


  function sendCommand() {
    device=$1; map2button=$2; map2type=$3; detectedMovement=$4;

    echo -e "Send mapped command :\n\tDevice : $1\n\tType : $3\n\tButton : $2\n\tMovement : $4\n\n"

#    if [ ${detectedMovement} = "pressed," ]; then
#	 evemu-event ${device} --sync --type ${map2type} --code ${map2button} --value 1;
#    else
#	 evemu-event ${device} --sync --type ${map2type} --code ${map2button} --value 0;
#    fi
  }

  function parseEventLine(){
    button=$3
    device=$1
    action=$2
    movement=$5

    IFS=" "
    read -r time button <<< `sed -r 's/[ \t]+/ /g' <<< "$button"`

    if ( IFS=$'\n'; echo "${mouseRemapDetect[*]}" ) | grep -qFx "$action-$button"; then
	extractLine=`( IFS=$'\n'; echo "${fileTxt}" ) | grep  "$action-$button"`

        IFS=" "
        read -r detected remap <<< $extractLine

        IFS="-"
        read -r remap_type remap_key <<< $remap

        IFS=" "
	sendCommand ${device} $remap_type $remap_key $movement
    fi;
  }



  elecom_huge_id=$(libinput list-devices | grep -i "ELECOM TrackBall Mouse HUGE TrackBall" -T1 | grep -o '/dev/input/event[0-9]*')

  if [ elecom_huge_id == "" ];
  then

    echo "No device detected !"

  else
  
    echo "Device detected : Elecom HUGE TrackBall"

    while read line; do
        parseEventLine ${line}
    done < <(stdbuf -oL libinput debug-events --device $elecom_huge_id)

  fi


