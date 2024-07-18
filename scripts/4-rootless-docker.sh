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
source $CONFIGS_DIR/setup.conf
echo -ne "rootless docker"
sudo curl -fsSL https://get.docker.com/rootless | sh

systemctl --user restart docker | systemctl --user start docker
systemctl --user enable --now docker | sudo loginctl enable-linger $(whoami)
echo "export PATH=/home/g00phy/bin:$PATH" >>$HOME/.bashrc
echo "export DOCKER_HOST=unix:///run/user/1000/docker.sock" >>$HOME/.bashrc
echo "docker enabled"

echo -ne "nvidia-container-toolkit "
$AUR_HELPER -S --noconfirm --needed nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
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