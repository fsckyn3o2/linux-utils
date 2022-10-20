#!/bin/bash


xcfe-conf-dpi() {
  case "$1" in
    "96" | "125" | "150")
      xfconf-query -c xsettings -p /Xft/DPI -s $1
      ;;
    *)
      echo "Option is DPI value [96,125,150]"
      echo "";;
  esac
}

