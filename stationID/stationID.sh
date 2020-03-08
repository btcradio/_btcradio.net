#!/usr/bin/env bash
# We automate to creat multiple stationID .mp3 files
# Then we add this folder to Localfiles in Spotify
# We distribute these StationID files throughout the queue


rm -f *.aiff
rm -f *.mp3

for (( i=0; i<10; ++i)); do

DATE=$(date +%s)
say -v fred "You are listening to B T C Radio Dot Net" -o stationID_$DATE.aiff

lame  stationID_$DATE.aiff  stationID_$DATE.mp3

rm -f *.aiff

sleep 2

done

#TODO  add idv3v2 commands
