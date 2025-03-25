#!/bin/bash

# Checking if is running in Repo Folder
if [[ "$(basename "$(pwd)" | tr '[:upper:]' '[:lower:]')" =~ ^scripts$ ]]; then
  echo "You are running this in arch_install Folder."
  echo "Please use ./archinstall.sh instead"
  exit
fi

# Installing git

echo "Cloning the arch_install Project"
git clone https://github.com/g00phy/arch_install

echo "Executing arch_install Script"

cd $HOME/arch_install

exec ./archinstall.sh
