yes | sudo pacman -S keepassxc

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

yes | paru -R blueberry

yes | paru -S bluez bluez-utils  blueman 

paru -Syu vlc deluge deluge-gtk
paru -S spotify-launcher python-pip sassc unzip file-roller eog apple-fonts
paru -S libreoffice-fresh gimp 
paru -S thunderbird 
pacman -S nvidia-settings 
paru -S kate
paru -S emby-server 

pacman -S tor

curl -fsSL https://get.docker.com/rootless | sh

sudo pacman -S nvidia-container-toolkit

sudo paru -S timeshift
paru -S prowlarr
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




