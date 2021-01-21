#!/bin/bash
echo "press any key to cancel startup"
read -n 1 -t 10 myKey

echo "updating"
cd /home/pi/Desktop/wg-log
git pull


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
    jq '.profile.exit_type= "Normal" | .profile.exited_cleanly = true' ~pi/.config/chromium/Default/Preferences > ~pi/.config/chromium/Default/Preferences
    chromium-browser --kiosk --disable-infobars --app=index.html
fi

