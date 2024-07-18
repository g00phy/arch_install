#!/usr/bin/env bash
#github-action genshdoc
#
# @file Post-Setup
# @brief Finalizing installation configurations and cleaning up after script.

echo -ne "
-------------------------------------------------------------------------
                    Enabling Essential Services
-------------------------------------------------------------------------
"
systemctl enable --now emby-server.service
echo "emby enabled"

systemctl enable --now bluetooth.service
echo "bluetooth enabled"

sudo systemctl daemon-reload
sudo systemctl enable --now prowlarr
echo "prowlarr enabled"

echo -ne "
-------------------------------------------------------------------------
               Enabling THEME
-------------------------------------------------------------------------
"
echo 'installing nord theme'
THEMES_DIR="$pwd/configs/usr/share"
NORD_THEME="NovaOS-nord" # can grab from config later if we allow selection
cp -rf ${THEMES_DIR}/${NORD_THEME}-Theme/${NORD_THEME}/ /usr/share/themes/
cp -rf ${THEMES_DIR}/${NORD_THEME}-Icons/${NORD_THEME}/ /usr/share/icons/

echo 'installing catpuccin theme'
cd ${THEMES_DIR}/gtk
source gtk-env/bin/activate
python3 build.py mocha --dest /usr/share/themes -a blue --tweaks black

echo -ne "
-------------------------------------------------------------------------
               enabling emby server dirs
-------------------------------------------------------------------------
"
cd /mnt || return
sudo mkdir media
sudo chmod -R 755 /mnt/media
sudo chown g00phy:g00phy /mnt/media

echo -ne "
-------------------------------------------------------------------------
                    SYSTEM READY FOR 4-rootless-docker.sh
-------------------------------------------------------------------------
"
exit