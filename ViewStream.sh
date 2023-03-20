#Script for checking and starting the camera display, setup to runs via cronjob everymin.
#shows 3 cameras
#exit on any key press
setterm -cursor off
#stream1
st1=`ps -ef | grep omxplayer | grep stream1 | cut -d'-' -f2 | cut -d' ' -f2`
echo "Checking & Starting Screen 1";
if [ "$st1" = "stream1" ]; 
 then 
  echo "Running Stream1..";
 else 
  echo "Starting Stream1..";
  screen -dmS stream1 sh -c 'omxplayer --live --refresh --video_queue 4 --fps 30 --win "0 0 1280 1080" rtsp://<username>:<password>@<ip-hikvision>/h264/ch4/main/av_stream';
fi
#stream2
st2=`ps -ef | grep omxplayer | grep stream2 | cut -d'-' -f2 | cut -d' ' -f2`
echo "Checking & Starting Screen 2";
if [ "$st2" = "stream2" ];
 then
  echo "Running Stream2..";
 else
  echo "Starting Stream2..";
  screen -dmS stream2 sh -c 'omxplayer --live --refresh --video_queue 4 --fps 30 --win "1280 0 1920 720" rtsp://<username>:<password>@<ip-hikvision>/h264/ch3/main/av_stream';
fi;
#stream3
st3=`ps -ef | grep omxplayer | grep stream3 | cut -d'-' -f2 | cut -d' ' -f2`
echo "Checking & Starting Screen 3";
if [ "$st3" = "stream3" ];
 then
  echo "Running Stream3..";
 else
  echo "Starting Stream3..";
  screen -dmS stream3 sh -c 'omxplayer --live --refresh --video_queue 4 --fps 30 --win "1280 720 1920 1080" rtsp://<username>:<password>@<ip-hikvision>/h264/ch1/main/av_stream';
fi;
Stream_Pid=`pidof ViewStream`
read input
kill -2 $Stream_Pid
