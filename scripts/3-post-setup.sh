#!/usr/bin/env bash
#github-action genshdoc
#
# @file Post-Setup
# @brief Finalizing installation configurations and cleaning up after script.


echo -ne "
-------------------------------------------------------------------------
               Enabling THEME
-------------------------------------------------------------------------
"
source $HOME/arch_install/configs/setup.conf
echo 'installing nord theme'
THEMES_DIR="$CONFIGS_DIR/usr/share/themes"
cd ${THEMES_DIR} || return
NORD_THEME="NovaOS-nord" # can grab from config later if we allow selection

git clone https://github.com/NicklasVraa/"${NORD_THEME}"-Icons.git
git clone https://github.com/NicklasVraa/"${NORD_THEME}"-Theme.git

sudo cp -rf ${NORD_THEME}-Theme/${NORD_THEME}/ /usr/share/themes/
sudo cp -rf ${NORD_THEME}-Icons/${NORD_THEME}/ /usr/share/icons/

echo 'installing catpuccin theme'
cd "${THEMES_DIR}"/gtk || return
python3 -m venv gtk-env
source gtk-env/bin/activate
pip install catppuccin
sudo gtk-env/bin/python "${THEMES_DIR}"/gtk/build.py mocha --dest /usr/share/themes -a blue --tweaks black
deactivate

echo -ne "
-------------------------------------------------------------------------
               enabling emby server dirs
-------------------------------------------------------------------------
"
cd /mnt || return
sudo mkdir -p media
sudo chmod -R 775 /mnt/media
sudo chown g00phy:g00phy /mnt/media
sudo chmod -R 775 /run/media/g00phy/EVA-2
sudo chmod -R 775 /run/media/g00phy/EVA-3

echo -ne "

-------------------------------------------------------------------------
                    Enabling Essential Services
-------------------------------------------------------------------------
"
source $CONFIGS_DIR/setup.conf
systemctl enable --now emby-server.service
echo "emby enabled"

systemctl enable --now bluetooth.service
echo "bluetooth enabled"

sudo systemctl daemon-reload
sudo systemctl enable --now prowlarr
echo "prowlarr enabled"

sudo systemctl enable --now deluged.service
echo "deluged enabled"

sudo systemctl daemon-reload
sudo systemctl enable --now radarr
sudo systemctl enable --now sonarr
sudo chown -R sonarr:sonarr /mnt/media/



echo -ne "
-------------------------------------------------------------------------
                    SYSTEM READY FOR 4-rootless-docker.sh
-------------------------------------------------------------------------
"
exit
