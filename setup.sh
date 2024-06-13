
yes | sudo pacman -S reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

yes | sudo pacman -R blueberry

yes | sudo pacman -S bluez bluez-utils  blueman
sudo systemctl enable bluetooth.service

yes | sudo pacman -Syu vlc keepassxc deluge 
sudo pacman -S firefox s
yes | sudo pacman -S spotify-launcher python-pip sassc unzip file-roller eog 
yes | sudo pacman -S libreoffice-fresh gimp 
sudo pacman -S thunderbird 
yes | sudo pacman -S ntfs-3g nvidia-settings kate
sudo pacman -S emby-server
sudo systemctl enable emby-server.service

yes | sudo pacman -S docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo groupadd docker
sudo usermod -aG docker $USER


sudo pacman -S --needed base-devel 
cd /run/media/g00phy/EVA-3/apps/yay
makepkg -si
yay --version
yay -S lazydocker

cd /run/media/g00phy/EVA-3/apps/themes
cp -r NovaOS-nord-Theme/NovaOS-nord/ /usr/share/themes/
cp -r NovaOS-nord-Icons/NovaOS-nord/ /usr/share/icons/

cd gtk
source gtk-env/bin/activate
python3 build.py mocha --dest /usr/share/themes -a blue --tweaks black

yay -Sy timeshift
yay -S prowlarr
yay -S pycharm-professional
