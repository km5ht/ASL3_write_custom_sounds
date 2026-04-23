A lot of people do not prefer to use the default voice Allison.
The file write_custom_sounds.sh is a bash script to generate
new custom voice files using the built-in Text To Speech system.
I tried to include all the common used words in the asterisk
vocabulary for Allstar.  My goal here is to convert all scripts
to the TTS system for voice sounds.

So you would start by installing TTS.
-----------------------------------------------------------------------
https://bohica.net/ham-radio/installing-text-to-speech-utilities-in-asl3/

https://github.com/AllStarLink/asl3-tts

https://github.com/rhasspy/piper/blob/master/VOICES.md

sudo apt-get install asl3-tts
sudo asl-tts -n <NODE_NUMBER> -t  " Hello, This is a test "

Download any extra voices you want to /var/lib/piper-tts/

#### Installed Voices
en_US-amy2-low.onnx

en_US-arctic-medium.onnx

en_US-hfc_female-medium.onnx

en_US-hfc_male-medium.onnx

en_US-kusal-medium.onnx

en_US-lessac-low.onnx

en_US-ljspeech-medium.onnx

en_US-norman-medium.onnx

en_US-ryan-low.onnx

## These entries go into root crontab to define the which voice to use.
## The rest of the world can then use the environment variable.
-------------------------------------------------------------------------------------------
#### Set the TTSVOICE environment variable.  I like these two because they talk fast.
#### Uncomment the one you want to use.
TTSVOICE=en_US-amy-low.onnx

TTSVOICE=en_US-hfc_male-medium.onnx
## Save the voice name off to a file in /tmp  this insures the
## environment variable is set for cron based announcements.
57 * * * * echo $TTSVOICE > /tmp/voice

## ttsvoice-definition.sh  is a bash helper script file.
