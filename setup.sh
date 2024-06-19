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

pacman -S nvidia-container-toolkit
nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
systemctl --user restart docker
sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place


sudo paru -Sy timeshift
sudo paru -S prowlarr
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

magnet:?xt=urn:btih:3166934af5501089413415a999e21037448807d1&dn=Joy%20Ride%201%2c%202%2c%203%20-%20Horror%20Trilogy%202001%202014%20Eng%20Subs%201080p%20%5bH264-mp4%5d&tr=udp%3a%2f%2fopen.stealth.si%3a80%2fannounce&tr=udp%3a%2f%2fexodus.desync.com%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.cyberia.is%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.torrent.eu.org%3a451%2fannounce&tr=udp%3a%2f%2fexplodie.org%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.birkenwald.de%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.moeking.me%3a6969%2fannounce&tr=udp%3a%2f%2fipv4.tracker.harry.lu%3a80%2fannounce&tr=udp%3a%2f%2ftracker.tiny-vps.com%3a6969%2fannounce
magnet:?xt=urn:btih:3166934af5501089413415a999e21037448807d1&dn=Joy%20Ride%201%2c%202%2c%203%20-%20Horror%20Trilogy%202001%202014%20Eng%20Subs%201080p%20%5bH264-mp4%5d&tr=udp%3a%2f%2fopen.stealth.si%3a80%2fannounce&tr=udp%3a%2f%2fexodus.desync.com%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.cyberia.is%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.torrent.eu.org%3a451%2fannounce&tr=udp%3a%2f%2fexplodie.org%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.birkenwald.de%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.moeking.me%3a6969%2fannounce&tr=udp%3a%2f%2fipv4.tracker.harry.lu%3a80%2fannounce&tr=udp%3a%2f%2ftracker.tiny-vps.com%3a6969%2fannounce
magnet:?xt=urn:btih:6445fe63f20b99b9cde983f304e73492103a0b19&dn=Kooman%20(2022)%20(2160p%20AMZN%20WEB-DL%20x265%20HEVC%2010bit%20EAC3%205.1%20Malayalam%20-mAck).mkv
magnet:?xt=urn:btih:06b6cb0d36e1784eb557ef2efb0380c4081ce5ee&dn=REMUX.1080p.Pandemonium.2023&tr=udp%3a%2f%2fopen.stealth.si%3a80%2fannounce&tr=udp%3a%2f%2fexodus.desync.com%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.cyberia.is%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.torrent.eu.org%3a451%2fannounce&tr=udp%3a%2f%2fexplodie.org%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.birkenwald.de%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.moeking.me%3a6969%2fannounce&tr=udp%3a%2f%2fipv4.tracker.harry.lu%3a80%2fannounce&tr=udp%3a%2f%2ftracker.tiny-vps.com%3a6969%2fannounce



