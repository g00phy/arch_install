#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
               setting up servarr user permissions
-------------------------------------------------------------------------
"

# Set up your .env file BEFORE running this script!!!
# export all variables from .env
set -a
source $CONFIGS_DIR/servarr/.env
set +a
# This is always going to complain about UID being a read-only variable.
# However that is not a problem and it's necessary for UID to be defined in the .env so that docker-compose.yml can take it.
# Reminder to set the UID variable in .env if you haven't already. It needs to be the user you want to run docker as. Find what it should be by running "id -u" from that user's shell.

# Create the mediacenter group (if not already created)
sudo groupadd -f mediacenter -g $MEDIACENTER_GID

# Add current user to mediacenter group (if not already a member)
sudo usermod -a -G mediacenter $CURRENT_UID

# Make directories for config and data
# ${ROOT_DIR:-.}/ means take the value from ROOT_DIR value, if failed or empty place it in the current folder
sudo mkdir -pv ${ROOT_DIR:-.}/config/{sonarr,radarr,prowlarr,qbittorrent,jellyfin,jellyseerr,bazarr}-config
sudo mkdir -pv ${ROOT_DIR:-.}/data/{torrents,media}/{tv,movies}

# Set permissions for directories
# Current user is $CURRENT_UID, so this will make the current user own the directories
sudo chmod -R 775 ${ROOT_DIR:-.}/data/
sudo chmod -R 775 ${ROOT_DIR:-.}/config/
sudo chown -R $CURRENT_UID:mediacenter ${ROOT_DIR:-.}/data/
sudo chown -R $CURRENT_UID:mediacenter ${ROOT_DIR:-.}/config/
sudo chown -R $CURRENT_UID:mediacenter ${ROOT_DIR:-.}/config/sonarr-config
sudo chown -R $CURRENT_UID:mediacenter ${ROOT_DIR:-.}/config/radarr-config
sudo chown -R $CURRENT_UID:mediacenter ${ROOT_DIR:-.}/config/prowlarr-config
sudo chown -R $CURRENT_UID:mediacenter ${ROOT_DIR:-.}/config/qbittorrent-config
sudo chown -R $CURRENT_UID:mediacenter ${ROOT_DIR:-.}/config/jellyfin-config
sudo chown -R $CURRENT_UID:mediacenter ${ROOT_DIR:-.}/config/jellyseerr-config
sudo chown -R $CURRENT_UID:mediacenter ${ROOT_DIR:-.}/config/bazarr-config

echo "Done! It is recommended to reboot now."

echo -ne "
-------------------------------------------------------------------------
                   servarr user permissions config done
-------------------------------------------------------------------------
"
exit
