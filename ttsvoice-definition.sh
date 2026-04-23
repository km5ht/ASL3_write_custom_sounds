#!/bin/bash
#
# Installed Voices
# en_US-amy2-low.onnx          en_US-arctic-medium.onnx   en_US-hfc_female-medium.onnx
# en_US-hfc_male-medium.onnx   en_US-kusal-medium.onnx    en_US-lessac-low.onnx
# en_US-ljspeech-medium.onnx   en_US-norman-medium.onnx   en_US-ryan-low.onnx
#
#
# Set a GLOBAL environment variable TTSVOICE
#
# This file lives in /home/Your_User_Name/scripts
#
# Please note that crontab is a special case
# and has it's own voice definition internal
#
# The voice is defined in root crontab and grabbed
# here for the rest of the world to use.
export TTSVOICE=$(</tmp/voice)  # Grab the voice definition created from CRONTAB
echo "TTSVOICE=$TTSVOICE"       # Do not change this line. It is needed for PERL code
