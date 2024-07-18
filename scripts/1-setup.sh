#!/usr/bin/env bash
#github-action genshdoc
#
# @file Setup
# @brief Configures installed system, installs base packages, and creates user. 
echo -ne "
-------------------------------------------------------------------------
                    Setting up mirrors for optimal download
-------------------------------------------------------------------------
"
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
echo -ne "
-------------------------------------------------------------------------
                    SYSTEM READY FOR 2-user.sh
-------------------------------------------------------------------------
"
