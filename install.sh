#!/usr/bin/env bash

echo "This script is regularly updated and fits the needs of me and only me. If you fall in the category of a
 .NET, C/C++ tinkerer, and SAAS owner welcome."

echo "Do you wish to install this program?"
select yn in "Yes" "No"; do
  case $yn in
  Yes)
    ./install_macos.sh
    break
    ;;
  No) exit ;;
  esac
done
