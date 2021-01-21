#!/bin/bash

echo "updating"
cd /home/pi/Desktop/wg-log
changed=1
git pull | grep -q 'Already up to date.' && changed=0
if [ $changed = 1 ]; then   # Restart script if there was an update
    ./run.sh
    exit;
fi

echo "installing"
# Startup initialization
sudo cp wglog.desktop /etc/xdg/autostart/wglog.desktop 
sudo chmod 644 /etc/xdg/autostart/wglog.desktop 
# Dependencies
sudo apt update
sudo apt install -y jq

echo "press any key to cancel startup"
read -n 1 -t 10 myKey
if [ $? = 0 ] ; then
    exit;
else
    cat ~/.config/chromium/Default/Preferences
    jq '.profile.exit_type= "Normal" | .profile.exited_cleanly = true' ~/.config/chromium/Default/Preferences | jq .
    sleep 20
    jq '.profile.exit_type= "Normal" | .profile.exited_cleanly = true' ~/.config/chromium/Default/Preferences > ~/.config/chromium/Default/Preferences
    chromium-browser --kiosk --disable-infobars --app=index.html
fi

