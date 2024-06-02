
yes | sudo pacman -S reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist


yes | sudo pacman -R blueberry

yes | sudo pacman -S bluez bluez-utils  blueman
sudo systemctl enable bluetooth.service

yes | sudo pacman -Syu vlc keepassxc deluge thunderbird firefox spotify-launcher python-pip sassc unzip file-roller eog libreoffice-fresh gimp thunderbird ntfs-3g

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

yay -Sy timeshift
yay -S prowlarr
