#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
               building Portainer & Homarr
-------------------------------------------------------------------------
"
set -a
source $CONFIGS_DIR/servarr/.env
set +a

# Set up directories
CONFIG_DIR="$ROOT_DIR/config"

# Create necessary directories
sudo mkdir -pv "$CONFIG_DIR/portainer" "$CONFIG_DIR/homarr"
sudo chown -R $(id -u):mediacenter "$CONFIG_DIR"

# Generate docker-compose.yml
echo "---" > docker-portainer-homarr.yml
echo "services:" >> docker-portainer-homarr.yml

generate_compose_entry() {
    local SERVICE=$1
    local PORTS=$2
    local IMAGE=$3
    local VOLUMES=$4
    cat <<EOF >> docker-portainer-homarr.yml
  $SERVICE:
    image: $IMAGE
    container_name: $SERVICE
    restart: unless-stopped
    volumes:
      $VOLUMES
    ports:
      - "$PORTS"
EOF
}

# Portainer: Web UI for managing Docker
generate_compose_entry "portainer" "9000:9000" "portainer/portainer-ce:latest" "- /var/run/docker.sock:/var/run/docker.sock\n      - $CONFIG_DIR/portainer:/data"

# Homarr: Dashboard for managing media apps
generate_compose_entry "homarr" "7575:7575" "ghcr.io/homarr-labs/homarr:latest" "- /var/run/docker.sock:/var/run/docker.sock\n      - $CONFIG_DIR/homarr:/data"

echo "Portainer & Homarr compose file generated successfully."

echo -ne "
-------------------------------------------------------------------------
            Portainer & Homarr building done
-------------------------------------------------------------------------
"
exit
