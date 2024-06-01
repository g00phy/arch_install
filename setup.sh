sudo pacman -S vlc keepassxc deluge thunderbird firefox

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor.service

