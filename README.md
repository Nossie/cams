view cameras

make sure you have omxplayer
- apt-get install omxplayer

if running on stock raspberry pi disable screen timeout

edit the file /etc/kbd/config by using vi /etc/kbd/config
```
#screen blanking timeout.  monitor remains on, but the screen is cleared to
# range: 0-60 min (0==never)  kernels I've looked at default to 10 minutes.
# (see linux/drivers/char/console.c)
BLANK_TIME=0
```

use the ViewStream.sh (make it executable)
you can run it via crontab to 'auto'refresh

