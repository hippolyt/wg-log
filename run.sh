echo "press any key to cancel startup"
read -t 10 myKey
if [ $? = 0 ] ; then
    exit;
else
    chromium-browser --start-fullscreen index.html
fi
