#!/bin/bash
sudo cp ./web/static/client/img/favicon.ico /usr/share/icons/hicolor/32x32/apps/sharemusic.png
nativefier --name "sharemusic" "https://music.grigri.cloud" --icon /usr/share/icons/hicolor/32x32/apps/sharemusic.png
sudo mv sharemusic-linux-x64 /opt/sharemusic
# Bug starting without permissions
sudo chown $USER:$GROUP -R /opt/sharemusic
