yes | sudo pacman -S keepassxc

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

yes | paru -R blueberry

yes | paru -S bluez bluez-utils  blueman |systemctl enable --now bluetooth.service

paru -Syu vlc deluge deluge-gtk
paru -S spotify-launcher python-pip sassc unzip file-roller eog apple-fonts
paru -S libreoffice-fresh gimp 
paru -S thunderbird 
pacman -S nvidia-settings 
paru -S kate
paru -S emby-server | systemctl enable --now emby-server.service

curl -fsSL https://get.docker.com/rootless | sh
echo "export PATH=/home/g00phy/bin:$PATH"
echo "export DOCKER_HOST=unix:///run/user/1000/docker.sock"
systemctl --user start docker | systemctl --user enable docker | sudo loginctl enable-linger $(whoami)

sudo pacman -S nvidia-container-toolkit
nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
systemctl --user restart docker
sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place



sudo paru -S timeshift
paru -S prowlarr
sudo systemctl daemon-reload
sudo systemctl enable --now prowlarr
paru -S pycharm-professional

cd /mnt
sudo mkdir media
sudo chmod -R 755 /mnt/media
sudo chown g00phy:g00phy /mnt/media

cd /run/media/g00phy/EVA-3/apps/themes
cp -r NovaOS-nord-Theme/NovaOS-nord/ /usr/share/themes/
cp -r NovaOS-nord-Icons/NovaOS-nord/ /usr/share/icons/

cd /run/media/g00phy/EVA-3/apps/themes/gtk
source gtk-env/bin/activate
python3 build.py mocha --dest /usr/share/themes -a blue --tweaks black



