
# Alsa Info and help

### speaker test
speaker-test -D plughw:0,0 -f 1000 -t sine -c 1
* -t sine	: the wave type is sinus
* -f 1000	: frequency of sine wave


### arecord - Capture and play loopback

arecord
* -l		: list all soundcards and digital devices
* -L		: list all PCM devices

The most general loopback command. Also enables PCM and Digital items in alsamixer
* `arecord | aplay`

Capture from device plughw:0,0 and play through it:
* -r 48000	: bit rate is 48000 bits per second
* -c 1		: channel 1 (Left)
* -F 2500
* -B 10000
* -f S16_LE	: format is 16 bits for sample
* examples:
```
arecord -D plughw:0,0 -r 48000 -c 1 -F 2500 -B 10000 -f S16_LE | aplay -D plughw:0,0 -r 48000 -c 1 -F 2500 -B 10000 -f S16_LE
arecord -D plughw:0,0 -r 48000 -c 2 -F 2500 -B 10000 -f S16_LE | aplay -D plughw:0,0 -r 48000 -c 2 -F 2500 -B 10000 -f S16_LE
arecord -D plughw:0,2 -r 48000 -c 1 -F 2500 -B 10000 -f S16_LE | aplay -D plughw:0,0 -r 48000 -c 2 -F 2500 -B 10000 -f S16_LE

arecord -D plughw:0,0 -r 48000 -f S16_LE -F 2500 -B 10000 | aplay -Dplughw:0,0 -r 48000 -f S16_LE -F 2500 -B 10000
arecord -f S16_LE -c2 -r48000 -B 80000 -F 10000 | aplay -f S16_LE -c2 -r48000 -B 80000 -F 10000
```

### alsamixer
* F3 - Playback direction: Don't forget to enable with M
* F4 - Capture direction : Don't forget to enable with <SPACE>

Store the alsa state:
* `alsactl store -f <filename>`
* `alsactl restore -f <filename>`
