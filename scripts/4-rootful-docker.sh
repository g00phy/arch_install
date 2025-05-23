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
sudo pacman -S fuse-overlayfs

# Add kernel.unprivileged_userns_clone=1 to /etc/sysctl.conf
echo "kernel.unprivileged_userns_clone=1" | sudo tee -a /etc/sysctl.conf

# Apply the sysctl changes
sudo sysctl --system
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
echo "docker enabled"

echo -ne "nvidia-container-toolkit "
sudo pacman -S --noconfirm --needed nvidia-container-toolkit
# shellcheck disable=SC2086
sudo nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
systemctl --user restart docker
sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place
echo "  nvidia docker enabled"

echo -ne "rootless docker buildx"
$AUR_HELPER -S --noconfirm --needed docker-buildx

echo -ne "
-------------------------------------------------------------------------
                    Installation done
-------------------------------------------------------------------------
"
exit
