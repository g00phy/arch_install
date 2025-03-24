#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
               Enabling servarr config
-------------------------------------------------------------------------
"

sudo cp -rf $HOME/arch_install/configs/servarr/sonarr/ /mnt/servarr/config/sonarr-config/
sudo cp -rf $HOME/arch_install/configs/servarr/prowlarr/ /mnt/servarr/config/prowlarr-config/
sudo cp -rf $HOME/arch_install/configs/servarr/radarr/ /mnt/servarr/config/radarr-config/


echo -ne "
-------------------------------------------------------------------------
                   servarr config done
-------------------------------------------------------------------------
"
exit
