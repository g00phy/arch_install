#!/bin/bash
#github-action genshdoc
#
# @file arch_install
# @brief Entrance script that launches children scripts for each phase of installation.

# Find the name of the folder the scripts are in
set -a
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts
CONFIGS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/configs
set +a
echo -ne "
-------------------------------------------------------------------------
                    Automated Arch Linux Installer
-------------------------------------------------------------------------
                Scripts are in directory named arch_install
"
    ( bash $SCRIPT_DIR/scripts/startup.sh )|& tee startup.log
      source $CONFIGS_DIR/setup.conf
    ( bash $SCRIPT_DIR/scripts/0-preinstall.sh )|& tee 0-preinstall.log
    ( $HOME/arch_install/scripts/1-setup.sh )|& tee 1-setup.log
    if [[ ! $DESKTOP_ENV == server ]]; then
      (su -l /usr/bin/runuser -u $USERNAME -- /home/$USERNAME/arch_install/scripts/2-user.sh )|& tee 2-user.log
    fi
    ( $HOME/arch_install/scripts/3-post-setup.sh )|& tee 3-post-setup.log
    ( $HOME/arch_install/scripts/4-rootless-docker.sh  )|& tee 4-rootless-docker.log
    cp -v *.log /home/$USERNAME
   
echo -ne "
-------------------------------------------------------------------------
                Done - Please Reboot
"
