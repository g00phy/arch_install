#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
               composing servarr stack yaml
-------------------------------------------------------------------------
"
#!/bin/bash

ROOT_DIR="/mnt/servarr"
TIMEZONE=$(cat /etc/timezone 2>/dev/null || echo "UTC")
CONFIG_DIR="$ROOT_DIR/config"
TORRENT_DIR="$ROOT_DIR/data/torrents"
MEDIA_DIR="$ROOT_DIR/data/media"

SERVICES=( "jellyfin" "sonarr" "radarr" "bazarr" "prowlarr" "qbittorrent" "jellyseerr" )

# Create necessary directories
sudo groupadd mediacenter -g 13000 2>/dev/null
sudo usermod -a -G mediacenter $USER
sudo mkdir -pv "$MEDIA_DIR/movies" "$MEDIA_DIR/tv" "$TORRENT_DIR"
sudo chown -R $(id -u):mediacenter "$ROOT_DIR/data"

# Function to create user and config directory
create_service_user() {
    local SERVICE=$1
    local USER_ID=$2
    sudo useradd "$SERVICE" -u "$USER_ID" 2>/dev/null
    sudo usermod -a -G mediacenter "$SERVICE"
    sudo mkdir -p "$CONFIG_DIR/$SERVICE-config" -m 775
    sudo chown -R "$SERVICE":mediacenter "$CONFIG_DIR/$SERVICE-config"
}

# Set up users
create_service_user "sonarr" 13001
create_service_user "radarr" 13002
create_service_user "bazarr" 13013
create_service_user "prowlarr" 13006
create_service_user "qbittorrent" 13007
create_service_user "jellyseerr" 13012

# Generate docker-compose.yml
echo "---" > docker-compose.yml
echo "services:" >> docker-compose.yml

generate_compose_entry() {
    local SERVICE=$1
    local USER_ID=$2
    local PORTS=$3
    local IMAGE=$4
    local VOLUMES=$5
    cat <<EOF >> docker-compose.yml
  $SERVICE:
    image: $IMAGE
    container_name: $SERVICE
    environment:
      - PUID=$USER_ID
      - PGID=13000
      - TZ=$TIMEZONE
    volumes:
      $VOLUMES
    ports:
      - "$PORTS"
    restart: unless-stopped
EOF
}

generate_compose_entry "jellyfin" $(id -u) "8096:8096" "lscr.io/linuxserver/jellyfin:latest" "- $CONFIG_DIR/jellyfin-config:/config\n      - $ROOT_DIR/data/media:/data"
generate_compose_entry "sonarr" 13001 "8989:8989" "lscr.io/linuxserver/sonarr:latest" "- $CONFIG_DIR/sonarr-config:/config\n      - $ROOT_DIR/data:/data"
generate_compose_entry "radarr" 13002 "7878:7878" "lscr.io/linuxserver/radarr:latest" "- $CONFIG_DIR/radarr-config:/config\n      - $ROOT_DIR/data:/data"
generate_compose_entry "bazarr" 13013 "6767:6767" "lscr.io/linuxserver/bazarr:latest" "- $CONFIG_DIR/bazarr-config:/config\n      - $ROOT_DIR/data/media:/media"
generate_compose_entry "prowlarr" 13006 "9696:9696" "lscr.io/linuxserver/prowlarr:develop" "- $CONFIG_DIR/prowlarr-config:/config"
generate_compose_entry "qbittorrent" 13007 "8080:8080" "lscr.io/linuxserver/qbittorrent:latest" "- $CONFIG_DIR/qbittorrent-config:/config\n      - $TORRENT_DIR:/data/torrents"
generate_compose_entry "jellyseerr" 13012 "5056:5055" "fallenbagel/jellyseerr:latest" "- $CONFIG_DIR/jellyseerr-config:/app/config"

echo "Docker compose file generated successfully. Run 'docker compose up -d' to start your containers."

echo -ne "
-------------------------------------------------------------------------
                   composure done
-------------------------------------------------------------------------
"
exit
