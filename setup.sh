echo 'blacklist ntfs3' | sudo tee /etc/modprobe.d/disable-ntfs3.conf

cd /run/media/g00phy/EVA-3/apps/paru
makepkg -si

yes | sudo paru -S reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

yes | sudo paru -R blueberry

yes | sudo paru -S bluez bluez-utils  blueman
sudo systemctl enable bluetooth.service

yes | sudo paru -Syu vlc keepassxc deluge deluge-gtk
yes | sudo paru -S spotify-launcher python-pip sassc unzip file-roller eog octopi apple-fonts
yes | sudo paru -S libreoffice-fresh gimp 
sudo paru -S thunderbird 
sudo pacman -S nvidia-settings 
sudo paru -S kate
sudo paru -S emby-server
sudo systemctl enable emby-server.service

curl -fsSL https://get.docker.com/rootless | sh
echo 'export PATH=/home/g00phy/bin:$PATH' >> ~/.bashrc
echo 'export DOCKER_HOST=unix:///run/user/1000/docker.sock' >> ~/.bashrc
systemctl --user start docker
systemctl --user enable docker
sudo loginctl enable-linger $(whoami)

pacman -S nvidia-container-toolkit
nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
systemctl --user restart docker
sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place


sudo paru -Sy timeshift
paru -S prowlarr
sudo systemctl daemon-reload
sudo systemctl enable --now prowlarr
paru -S pycharm-professional

sudo chmod -R 755 /mnt/media
sudo chown g00phy:g00phy /mnt/media


cd /run/media/g00phy/EVA-3/apps/themes
cp -r NovaOS-nord-Theme/NovaOS-nord/ /usr/share/themes/
cp -r NovaOS-nord-Icons/NovaOS-nord/ /usr/share/icons/

cd /run/media/g00phy/EVA-3/apps/themes/gtk
source gtk-env/bin/activate
python3 build.py mocha --dest /usr/share/themes -a blue --tweaks black

docker buildx build . -t eda-process-img:latest
docker run -d -p 52022:22 --runtime=nvidia --gpus all eda-process-img 

