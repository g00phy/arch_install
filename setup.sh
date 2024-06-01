yes | sudo pacman -R bluez-utils
yes | sudo pacman -R blueberry

yes | sudo pacman -S bluez
yes | sudo pacman -S bluez-utils
yes | sudo pacman -S blueman
sudo systemctl enable bluetooth.service

yes | sudo pacman -Syu vlc keepassxc deluge thunderbird firefox spotify-launcher python-pip sassc unzip file-roller feh


git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor.service
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install pycharm-professional --classic

sudo snap install slack

cd /media/g00phy/EVA-3/apps/themes
cp -r NovaOS-nord-Theme/NovaOS-nord/ /usr/share/themes/
cp -r NovaOS-nord-Icons/NovaOS-nord/ /usr/share/icons/

cd gtk
source gtk-env/bin/activate
python3 build.py mocha --dest /usr/share/themes -a blue --tweaks black

