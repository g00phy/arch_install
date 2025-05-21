#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
               bringing up servarr stack containers
-------------------------------------------------------------------------
"
sudo cp -r ~/arch_install/config/servarr/config/* /mnt/servarr/config/

docker-compose -f ~/arch_install/servarr/docker-compose.yml up --build -d

echo -ne "
-------------------------------------------------------------------------
                   servarr containers set up
-------------------------------------------------------------------------
"
exit
