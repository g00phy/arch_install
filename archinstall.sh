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
SERVARR_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/servarr
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
    ( bash $HOME/arch_install/scripts/1-setup.sh )|& tee 1-setup.log
    if [[ ! $DESKTOP_ENV == server ]]; then
      ( $HOME/arch_install/scripts/2-user.sh )|& tee 2-user.log
    fi
    (bash $HOME/arch_install/scripts/3-post-setup.sh )|& tee 3-post-setup.log
    (bash $HOME/arch_install/scripts/4-rootless-docker.sh  )|& tee 4-rootless-docker.log
    (bash $HOME/arch_install/servarr/5-servarr-setup.sh  )|& tee 5-servarr-setup.log
    (bash $HOME/arch_install/servarr/6-1-generate_docker_composer.sh  )|& tee 6-1-generate_docker_composer.log
    (bash $HOME/arch_install/servarr/6-2-generate-portainer-composer.sh )|& tee 6-2-generate-portainer-composer.log
    (bash $HOME/arch_install/servarr/7-servarr-pull.sh  )|& tee 7-servarr-pull.log
     (bash $HOME/arch_install/servarr/8-servarr-config.sh  )|& tee 8-servarr-config.log
    mkdir $HOME/logs
    cp -v *.log $HOME/logs
   
echo -ne "
-------------------------------------------------------------------------
                Done - Please Reboot
"
