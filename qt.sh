#!/bin/bash

export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=1.4
export QT_FONT_DPI=96

qt-hdpi() {

  # -----
  # ADD application name and path in switch case
  # -----
  case "$1" in
    "qtcreator")
        "/path2qtcreator";;
    "" | "help")
        echo "[applicationname] : example [qtcreator].";;
    *)
        . "$1"
  esac
}

