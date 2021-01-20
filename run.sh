echo "press any key to cancel startup"
read -n 1 -t 10 myKey

echo "updating"
cd /home/pi/Desktop/wg-log
git pull


echo "installing"
sudo cp wg-log.desktop /etc/xdg/autostart/


echo "press any key to cancel startup"
read -n 1 -t 10 myKey
if [ $? = 0 ] ; then
    exit;
else
    chromium-browser --start-fullscreen index.html
fi

# in final version use --kiosk to disable keyboard input
