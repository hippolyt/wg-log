#!/bin/bash

echo "updating"
cd /home/pi/Desktop/wg-log
changed=1
git pull | grep -q 'Already up to date.' && changed=0
if [ $changed = 1 ]; then   # Restart script if there was an update
    sleep 1
    ./run.sh
    exit;
fi

echo "installing"
# Autostart initialization
sudo cp wglog.desktop /etc/xdg/autostart/wglog.desktop 
sudo chmod 644 /etc/xdg/autostart/wglog.desktop 

echo "preparing"
# Delete chromium Crash error message
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences
sed -i 's/"exit_type": "Crashed"/"exit_type": "Normal"/' ~/.config/chromium/Default/Preferences

echo "press any key to cancel startup"
read -n 1 -t 10 myKey
if [ $? = 0 ] ; then
    exit;
else
    chromium-browser --kiosk --disable-infobars index.html
fi

