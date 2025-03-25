#!/bin/bash
#github-action genshdoc
#
# @file arch_install
# @brief Entrance script that launches children scripts for each phase of installation.

# Find the name of the folder the scripts are in
set -a
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
SCRIPTS_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"/scripts
CONFIGS_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"/config
SERVARR_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"/servarr
set +a
echo -ne "
-------------------------------------------------------------------------
                    Automated Arch Linux Installer
-------------------------------------------------------------------------
                Scripts are in directory named arch_install
"
    bash $SCRIPT_DIR/scripts/startup.sh
    source $CONFIGS_DIR/setup.conf
    bash $SCRIPT_DIR/scripts/0-preinstall.sh
    bash $HOME/arch_install/scripts/1-setup.sh
    if [[ ! $DESKTOP_ENV == server ]]; then
      bash $HOME/arch_install/scripts/2-user.sh
    fi
    bash $HOME/arch_install/scripts/3-post-setup.sh
    bash $HOME/arch_install/scripts/4-rootless-docker.sh
    bash $HOME/arch_install/servarr/5-generate_docker_composer.sh

echo -ne "
-------------------------------------------------------------------------
                Done - Please Reboot
"
