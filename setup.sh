yes | sudo pacman -R blueberry

yes | sudo pacman -S bluez
yes | sudo pacman -S bluez-utils
yes | sudo pacman -S blueman
sudo systemctl enable bluetooth.service

cd /run/media/g00phy/EVA-3/apps/
sudo usermod -aG kvm $USER
sudo pacman -S gnome-terminal

sudo cp docker/* /usr/bin/
sudo dockerd &
sudo docker run hello-world

sudo pacman -U ./docker-desktop-4.30.0-x86_64.pkg.tar.zst

yes | sudo pacman -Syu vlc keepassxc deluge thunderbird firefox spotify-launcher python-pip sassc unzip file-roller eog


sudo pacman -S --needed base-devel 
cd /run/media/g00phy/EVA-3/apps/yay
makepkg -si
yay --version
yay -S lazydocker

cd /run/media/g00phy/EVA-3/apps/snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor.service
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install pycharm-professional --classic

sudo snap install slack

cd /run/media/g00phy/EVA-3/apps/themes
cp -r NovaOS-nord-Theme/NovaOS-nord/ /usr/share/themes/
cp -r NovaOS-nord-Icons/NovaOS-nord/ /usr/share/icons/

cd gtk
source gtk-env/bin/activate
python3 build.py mocha --dest /usr/share/themes -a blue --tweaks black

