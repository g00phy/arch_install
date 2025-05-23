#!/usr/bin/env bash
#github-action genshdoc
#
# @file Post-Setup
# @brief Finalizing installation configurations and cleaning up after script.

echo -ne "
-------------------------------------------------------------------------
                    Installing docker
-------------------------------------------------------------------------
"
source "$CONFIGS_DIR"/setup.conf


echo -ne "rootless docker"
# Install fuse-overlayfs
sudo pacman -S --noconfirm --needed docker nvidia-container-toolkit

# Apply the sysctl changes
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
echo "docker enabled"

echo -ne "nvidia-container-toolkit "
# shellcheck disable=SC2086
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
echo "  nvidia docker enabled"

echo -ne "rootless docker buildx"
$AUR_HELPER -S --noconfirm --needed docker-buildx

echo -ne "
-------------------------------------------------------------------------
                    Installation done
-------------------------------------------------------------------------
"
exit
