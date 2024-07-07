

systemctl --user restart docker | systemctl --user start docker
systemctl --user enable docker | sudo loginctl enable-linger $(whoami) 

nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place

systemctl enable --now emby-server.service | systemctl enable --now bluetooth.service

sudo systemctl daemon-reload
sudo systemctl enable --now prowlarr
