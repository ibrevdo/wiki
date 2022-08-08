# ffmpeg howto

```sh
ffmpeg -i input.file
  learn audio and video info about the input.file

ffmpeg -formats
  get list of codecs and formats the ffmpeg can work with

-acodec copy
  use same codec to encode as to decode


  


Example 1: convert wav to mp3
------------------------------
ffmpeg -i audio.wav -acodec mp3 -ab 192k audio.mp3

-i audio.wav
   input file. if there are more than one, precede with "-i" every one of them
-acodec mp3
   use mp3 audio codec to compress the target file
-ab 192k
   audio bit rate of 192 kbit/sec
audio.mp3
   dump the encoded data to this file


Example 2: convert wav to vorbis
---------------------------------
ffmpeg -i audio.wav -acodec vorbis -aq 60 audio.ogg

-acodec vorbis -aq 60
  as vorbis is a variable bit rate (VBR) codec, the -aq option tells what quality
  of sound you want. 0 is the worst, 60 is parallel to 160 kbit/s



Example 3: encode and audio in 22050 Hz, convert to mono, use much lower bitrate,
	   and generate mp2.
---------------------------------------------------------------------------------
ffmpeg -i audio.wav -acodec mp2 -ac 1 -ar 22050 -ab 64k audio.mp2

-ac 1
  Tells ffmpeg to downmix the audio input to 1 audio channel (mono) instead of
  leaving it as the input (stereo, 2 channels).
-ar 22050
  Tells ffmpeg to resample the audio at 22050 Hz instead of leaving it at 44100 Hz.
```
