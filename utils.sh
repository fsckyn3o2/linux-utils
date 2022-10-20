#!/bin/bash

compare_string_insensitive() {
  echo "$1" | grep -qi "^$2$" && echo "Strings are equal" || echo "String are NOT equal"
}

alias firefox-profile="firefox --profile /home/$HOME/firefox-profiles/$1"
