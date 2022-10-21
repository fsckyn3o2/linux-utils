#!/bin/bash
export scriptsRegister+=("bluetooth")

bluetooth-restart() {
  echo "kill bluetoothd"
  sudo killall bluetoothd
  echo "wait 5 sec."
  sleep 5
  echo "restart bluetooth"
  sudo systemctl start bluetooth
}


