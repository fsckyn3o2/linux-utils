#!/bin/bash

pdf-rotate() {
  degree="1-endeast"
  
  case "$3" in
  "180")
    degree="1-south";;  
  "90")
    degree="1-endeast";;
  "-90")
    degree="endeast";;
  "-180")
    degree="south";;
  esac

  pdftk "$1" cat $degree output "$2"
}

pdf-compress() {
  pdf2ps $1 "${1}_smaller.ps"
  ps2pdf "${1}_smaller.ps" "${1}_smaller.pdf"
  rm "${1}_smaller.ps"
}

alias pdf-rotate="sh /srv/Applications/my_scripts/pdf_operation/pdf-rotate.sh"
alias pdf-unite="pdfunite"
alias pdftk="pdftk"

