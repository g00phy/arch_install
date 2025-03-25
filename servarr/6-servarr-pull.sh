#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
               bringing up servarr stack containers
-------------------------------------------------------------------------
"
sudo cp -r ~/arch_install/configs/servarr/config/* /mnt/servarr/config/

docker-compose -f docker-compose.yml up --build -d

echo -ne "
-------------------------------------------------------------------------
                   servarr containers set up
-------------------------------------------------------------------------
"
exit
