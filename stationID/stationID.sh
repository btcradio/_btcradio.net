#!/usr/bin/env bash
# We automate to creat multiple stationID .mp3 files
# Then we add this folder to Localfiles in Spotify
# We distribute these StationID files throughout the queue


rm -f *.aiff
rm -f *.mp3

COUNT=1

for (( i=1; i<i=1000; ++i)); do

for letter in {A..Z} ; do
  echo $letter

for vowel in {a,e,i,o,u} ; do
  echo $vowel


DATE=$(date +%s)
say -v fred "You are listening to B T C Radio Dot Net" -o stationID.$DATE.aiff

lame  stationID.$DATE.aiff $letter$vowel.$DATE.mp3
lame  stationID.$DATE.aiff  $COUNT.$DATE.mp3





id3v2 -t $COUNT."btcRadio.net" $COUNT.$DATE.mp3
sleep 0.5
id3v2 -a $COUNT."btcRadio.net" $COUNT.$DATE.mp3
sleep 0.5
id3v2 -A $COUNT."btcRadio.net" $COUNT.$DATE.mp3
sleep 0.5
id3v2 -c $COUNT."btcRadio.net":"StationID":"en" $COUNT.$DATE.mp3
sleep 0.5
id3v2 --WORS "http://listen.btcRadio.net" $COUNT.$DATE.mp3
sleep 0.5
#
id3v2 -t $letter$vowel."btcRadio.net" $letter$vowel.$DATE.mp3
sleep 0.5
id3v2 -a $letter$vowel."btcRadio.net" $letter$vowel.$DATE.mp3
sleep 0.5
id3v2 -A $letter$vowel."btcRadio.net" $letter$vowel.$DATE.mp3
sleep 0.5
id3v2 -c $letter$vowel."btcRadio.net":"StationID":"en" $letter$vowel.$DATE.mp3
sleep 0.5
id3v2 --WORS "http://listen.btcRadio.net" $letter$vowel.$DATE.mp3
sleep 0.5
#
rm -f *.aiff
sleep 0.5

((COUNT+=10))

done
done
done

