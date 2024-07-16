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


magnet:?xt=urn:btih:8829abb305a61e173cc429866913f0f542cac37e&dn=Skye%20Blue%20%5bbt%5d&tr=udp%3a%2f%2ftracker.leechers-paradise.org%3a6969&tr=udp%3a%2f%2ftracker.coppersurfer.tk%3a6969&tr=http%3a%2f%2fretracker.local%2fannounce&tr=udp%3a%2f%2fshubt.net%3a2710&tr=udp%3a%2f%2ftracker.leechers-paradise.org%3a6969&tr=udp%3a%2f%2fexplodie.org%3a6969&tr=udp%3a%2f%2ftracker.zer0day.to%3a1337&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337&tr=http%3a%2f%2fp4p.arenabg.ch%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.kuroy.me%3a5944&tr=udp%3a%2f%2fopen.stealth.si%3a80&tr=http%3a%2f%2fbt.uniondht.org%3a777%2fannounce

magnet:?xt=urn:btih:8f39fea9eccabcb7ff8795a0bd1c60f0135cc2aa&dn=%e3%80%90%e9%a6%96%e5%8f%91%e4%ba%8e%e9%ab%98%e6%b8%85%e5%bd%b1%e8%a7%86%e4%b9%8b%e5%ae%b6%20www.BBQDDQ.com%e3%80%91%e6%9f%8f%e6%9e%97%e8%b0%8d%e5%bd%b1%5b%e7%ae%80%e7%b9%81%e8%8b%b1%e5%ad%97%e5%b9%95%5d.The.Spy.Who.Came.in.from.the.Cold.1965.CC.Bluray.1080p.x265.10bit.FLAC.REPACK-MiniHD
magnet:?xt=urn:btih:61186ae072bbccc9e11f4bef61f7a1ac91ea812d&dn=The.Crossing.Guard.1995.BDRip.1080p.NNMClub.mkv
magnet:?xt=urn:btih:8f39fea9eccabcb7ff8795a0bd1c60f0135cc2aa&dn=%e3%80%90%e9%a6%96%e5%8f%91%e4%ba%8e%e9%ab%98%e6%b8%85%e5%bd%b1%e8%a7%86%e4%b9%8b%e5%ae%b6%20www.BBQDDQ.com%e3%80%91%e6%9f%8f%e6%9e%97%e8%b0%8d%e5%bd%b1%5b%e7%ae%80%e7%b9%81%e8%8b%b1%e5%ad%97%e5%b9%95%5d.The.Spy.Who.Came.in.from.the.Cold.1965.CC.Bluray.1080p.x265.10bit.FLAC.REPACK-MiniHD
magnet:?xt=urn:btih:1c1c245195811a9448c57605ed4518fb04ccade1&dn=%d0%9f%d0%be%d0%b4%d1%86%d0%b5%d0%bf%d0%bb%d0%b5%d0%bd%20%d0%bf%d0%be-%d0%ba%d1%80%d1%83%d0%bf%d0%bd%d0%be%d0%bc%d1%83&tr=http%3a%2f%2fwww.nntt.org%2ftracker%2fannounce2.php%3fuk%3d267ab703613281f96df17cb4fc252a05&tr=http%3a%2f%2f80.246.243.18%3a6969%2fannounce&tr=http%3a%2f%2ftracker.grepler.com%3a6969%2fannounce&tr=http%3a%2f%2ftracker2.wasabii.com.tw%3a6969%2fannounce&tr=http%3a%2f%2ftracker.filetracker.pl%3a8089%2fannounce&tr=http%3a%2f%2fwww.bithq.org%2fannounce.php&tr=udp%3a%2f%2fshubt.net%3a2710&tr=http%3a%2f%2ftracker.tfile.me%2fannounce&tr=http%3a%2f%2fi.bandito.org%2fannounce.php&tr=udp%3a%2f%2ftracker.openbittorrent.com%3a80&tr=udp%3a%2f%2ftracker.publicbt.com%3a80&tr=http%3a%2f%2fbt.nntt.org%2fannounce%3fuk%3d267ab703613281f96df17cb4fc252a05&tr=http%3a%2f%2fretracker.local%2fannounce


