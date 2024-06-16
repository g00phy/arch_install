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
sudo paru -S firefox s
yes | sudo paru -S spotify-launcher python-pip sassc unzip file-roller eog 
yes | sudo paru -S libreoffice-fresh gimp 
sudo paru -S thunderbird 
sudo paru -S nvidia-settings 
sudo paru -S kate
sudo paru -S emby-server
sudo systemctl enable emby-server.service

curl -fsSL https://get.docker.com/rootless | sh
echo 'export PATH=/home/g00phy/bin:$PATH' >> ~/.bashrc
echo 'export DOCKER_HOST=unix:///run/user/1000/docker.sock' >> ~/.bashrc
systemctl --user start docker
systemctl --user enable docker
sudo loginctl enable-linger $(whoami)

paru -S lazydocker
paru -Sy timeshift
paru -S prowlarr
sudo systemctl daemon-reload
sudo systemctl enable --now prowlarr
paru -S pycharm-professional

sudo chmod -R 755 /mnt/media
paru -S ttf-roboto-slab

cd /run/media/g00phy/EVA-3/apps/themes
cp -r NovaOS-nord-Theme/NovaOS-nord/ /usr/share/themes/
cp -r NovaOS-nord-Icons/NovaOS-nord/ /usr/share/icons/

cd /run/media/g00phy/EVA-3/apps/themes/gtk
source gtk-env/bin/activate
python3 build.py mocha --dest /usr/share/themes -a blue --tweaks black



