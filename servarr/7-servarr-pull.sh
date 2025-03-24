#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
               pulling servarr stack containers
-------------------------------------------------------------------------
"
docker compose -f docker-compose.yml pull & docker compose -f docker-portainer-homarr.yml pull & wait

echo -ne "
-------------------------------------------------------------------------
                   servarr containers set up
-------------------------------------------------------------------------
"
exit
