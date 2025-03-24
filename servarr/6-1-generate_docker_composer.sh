#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
               composing servarr stack yaml
-------------------------------------------------------------------------
"

set -a
source $CONFIGS_DIR/servarr/.env
set +a

# To find your system's preconfigured timezone run: cat /etc/timezone
TIMEZONE=$(cat /etc/timezone 2>/dev/null || echo "UTC")
# Get the current user's UID
CURRENT_USER=$(whoami)
CURRENT_UID=$(id -u)

CONFIG_DIR="$ROOT_DIR/config"
TORRENT_DIR="$ROOT_DIR/data/torrents"
MEDIA_DIR="$ROOT_DIR/data/media"

SERVICES=( "jellyfin" "sonarr" "radarr" "bazarr" "prowlarr" "qbittorrent" "jellyseerr" )

# Create necessary directories
sudo groupadd mediacenter -g 13000 2>/dev/null
sudo usermod -a -G mediacenter $CURRENT_USER
sudo mkdir -pv "$MEDIA_DIR/movies" "$MEDIA_DIR/tv" "$TORRENT_DIR"
sudo chown -R $CURRENT_USER:mediacenter "$ROOT_DIR/data"

# Set up current user as the owner for all service directories
# Create config directories and assign them to the current user
for SERVICE in "${SERVICES[@]}"; do
    sudo mkdir -p "$CONFIG_DIR/$SERVICE-config" -m 775
    sudo chown -R $CURRENT_USER:mediacenter "$CONFIG_DIR/$SERVICE-config"
done

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

# Generate compose entries with current user UID
generate_compose_entry "jellyfin" "$(id -u)" "8096:8096" "lscr.io/linuxserver/jellyfin:latest" "- $CONFIG_DIR/jellyfin-config:/config\n      - $ROOT_DIR/data/media:/data"
generate_compose_entry "sonarr" "$(id -u)" "8989:8989" "lscr.io/linuxserver/sonarr:latest" "- $CONFIG_DIR/sonarr-config:/config\n      - $ROOT_DIR/data:/data"
generate_compose_entry "radarr" "$(id -u)" "7878:7878" "lscr.io/linuxserver/radarr:latest" "- $CONFIG_DIR/radarr-config:/config\n      - $ROOT_DIR/data:/data"
generate_compose_entry "bazarr" "$(id -u)" "6767:6767" "lscr.io/linuxserver/bazarr:latest" "- $CONFIG_DIR/bazarr-config:/config\n      - $ROOT_DIR/data/media:/media"
generate_compose_entry "prowlarr" "$(id -u)""9696:9696" "lscr.io/linuxserver/prowlarr:develop" "- $CONFIG_DIR/prowlarr-config:/config"
generate_compose_entry "qbittorrent" "$(id -u)" "8080:8080" "lscr.io/linuxserver/qbittorrent:latest" "- $CONFIG_DIR/qbittorrent-config:/config\n      - $TORRENT_DIR:/data/torrents"
generate_compose_entry "jellyseerr" "$(id -u)" "5056:5055" "fallenbagel/jellyseerr:latest" "- $CONFIG_DIR/jellyseerr-config:/app/config"

echo "Docker compose file generated successfully. Run 'docker compose up -d' to start your containers."

echo -ne "
-------------------------------------------------------------------------
                   composure done
-------------------------------------------------------------------------
"
exit
