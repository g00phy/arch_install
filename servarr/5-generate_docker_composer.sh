#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
               composing servarr stack yaml
-------------------------------------------------------------------------
"

ROOT_DIR=/mnt/servarr
MEDIACENTER_GID=$(whoami)
CURRENT_USER=$(whoami)
TIMEZONE=$(cat /etc/timezone 2>/dev/null || echo "UTC")

CONFIG_DIR="$ROOT_DIR/config"
DATA_DIR="$ROOT_DIR/data"
TORRENT_DIR="$DATA_DIR/torrents"
MEDIA_DIR="$DATA_DIR/media"

SERVICES=("emby" "sonarr" "radarr" "prowlarr" "deluge" "flaresolverr" "jellyseerr" "portainer")

sudo mkdir -pv "${CONFIG_DIR:-.}" "${DATA_DIR:-.}" "$MEDIA_DIR/movies" "$MEDIA_DIR/tv" "$TORRENT_DIR"
sudo chown -R $CURRENT_USER:$MEDIACENTER_GID "$DATA_DIR" "$CONFIG_DIR"

sudo chmod -R 777 $DATA_DIR
sudo chmod -R 777 $CONFIG_DIR

for SERVICE in "${SERVICES[@]}"; do
  sudo mkdir -p "$CONFIG_DIR/$SERVICE-config" -m 777
  sudo chown -R $CURRENT_USER:$MEDIACENTER_GID "$CONFIG_DIR/$SERVICE-config"
done

# Generate docker-compose.yml
echo "---" >>$HOME/arch_install/servarr/docker-compose.yml
echo "services:" >>$HOME/arch_install/servarr/docker-compose.yml
#!/bin/bash

echo "
  emby:
    image: emby/embyserver:4.9.0.42
    container_name: emby
    networks:
      - servarr-network
    runtime: nvidia
    environment:
      - PUID=$(id -u)
      - PGID=$(id -u)
      - TZ=$TIMEZONE
      - NVIDIA_VISIBLE_DEVICES=all    # This will allow Emby to use all available GPUs
      - NVIDIA_DRIVER_CAPABILITIES=compute,video,utility
    volumes:
      - /mnt/servarr/data/media/movies:/data/movies
      - /mnt/servarr/data/media/tv:/data/tv
      - /mnt/servarr/config/emby-config:/config
    ports:
      - '8096:8096'   # Web UI port
      - '8920:8920'   # HTTPS port (optional)
    restart: on-failure
    devices:
      - /dev/nvidia0
      - /dev/nvidiactl
      - /dev/nvidia-uvm
    shm_size: '2gb'
" >>$HOME/arch_install/servarr/docker-compose.yml

generate_compose_entry() {
  local SERVICE=$1
  local USER_ID=$2
  local PORTS=$3
  local IMAGE=$4
  local VOLUMES=$5
  local ENV_VARS=$6
  cat <<EOF >>$HOME/arch_install/servarr/docker-compose.yml
  $SERVICE:
    image: $IMAGE
    container_name: $SERVICE
    networks:
      - servarr-network
    volumes:
EOF
  for VOLUME in $VOLUMES; do
    echo "      - $VOLUME" >>$HOME/arch_install/servarr/docker-compose.yml
  done
  cat <<EOF >>$HOME/arch_install/servarr/docker-compose.yml
    environment:
      - PUID=$USER_ID
      - PGID=$USER_ID
      - TZ=$TIMEZONE
EOF
  if [[ -n $ENV_VARS ]]; then
    for ENV_VAR in $ENV_VARS; do
      echo "      - $ENV_VAR" >>$HOME/arch_install/servarr/docker-compose.yml
    done
  fi
  cat <<EOF >>$HOME/arch_install/servarr/docker-compose.yml
    restart: unless-stopped
    ports:
EOF
  if [[ -n $PORTS ]]; then
    for PORT in $PORTS; do
      echo "      - $PORT" >>$HOME/arch_install/servarr/docker-compose.yml
    done
  fi
}
generate_compose_entry "deluge" "$(id -u)" "8112:8112 6881:6881" "lscr.io/linuxserver/deluge:latest" "/mnt/servarr/config/deluge-config:/config /mnt/servarr/data:/data"
generate_compose_entry "sonarr" "$(id -u)" "8989:8989" "lscr.io/linuxserver/sonarr:latest" "/mnt/servarr/config/sonarr-config:/config /mnt/servarr/data:/data"
generate_compose_entry "radarr" "$(id -u)" "7878:7878" "lscr.io/linuxserver/radarr:latest" "/mnt/servarr/config/radarr-config:/config /mnt/servarr/data:/data"

# Prowlarr with DNS settings
echo "
  prowlarr:
    image: lscr.io/linuxserver/prowlarr:develop
    container_name: prowlarr
    networks:
      - servarr-network
    volumes:
      - /mnt/servarr/config/prowlarr-config:/config
    environment:
      - PUID=$(id -u)
      - PGID=$(id -u)
      - TZ=$TIMEZONE
      - DOTNET_SYSTEM_NET_HTTP_USEIPV6=false
    dns:
      - 1.1.1.1
      - 8.8.8.8
    restart: unless-stopped
    ports:
      - '9696:9696'
" >>$HOME/arch_install/servarr/docker-compose.yml


generate_compose_entry "jellyseerr" "$(id -u)" "5056:5055" "fallenbagel/jellyseerr:2.5.1" "/mnt/servarr/config/jellyseerr-config:/app/config"
generate_compose_entry "flaresolverr" "$(id -u)" "8191:8191" "ghcr.io/flaresolverr/flaresolverr:latest" "/mnt/servarr/config/flaresolverr-config:/app/config"

generate_compose_entry "portainer" "$(id -u)" "9000:9000" "portainer/portainer-ce:2.28.0" "/run/user/1000/docker.sock:/var/run/docker.sock /mnt/servarr/config/portainer-config:/data"
#generate_compose_entry "homarr" "$(id -u)" "7575:7575" "ghcr.io/ajnart/homarr:0.15.10" "/run/user/1000/docker.sock:/var/run/docker.sock /mnt/servarr/config/homarr-config:/appdata" "SECRET_ENCRYPTION_KEY=$HOMARR_SECRET_KEY"

echo "networks:" >>$HOME/arch_install/servarr/docker-compose.yml
echo "    servarr-network:" >>$HOME/arch_install/servarr/docker-compose.yml
echo "        driver: bridge" >>$HOME/arch_install/servarr/docker-compose.yml
echo "Docker compose file generated successfully. Run 'docker compose up -d' to start your containers."

echo -ne "
-------------------------------------------------------------------------
                   composure done
-------------------------------------------------------------------------
"
exit
