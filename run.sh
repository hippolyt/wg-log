echo "press any key to cancel startup"
read -n 1 -t 10 myKey
if [ $? = 0 ] ; then
    exit;
else
    chromium-browser --start-fullscreen index.html
fi
