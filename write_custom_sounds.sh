#!/bin/bash
# KM5HT
# Directories and files for Allstarlink custom sounds
#
# https://community.allstarlink.org/t/sounds-directory/22606/5
#
# Installed Voices
# en_US-amy2-low.onnx          en_US-arctic-medium.onnx          en_US-hfc_female-medium.onnx
# en_US-hfc_male-medium.onnx   en_US-kusal-medium.onnx           en_US-lessac-low.onnx
# en_US-ljspeech-medium.onnx   en_US-norman-medium.onnx          en_US-ryan-low.onnx
#
# Set the TTSVOICE environment variable
# This file lives in /home/Your_User_Name/scripts
#
if [ ! -e /tmp/voice ]; then
   echo "No voice definition found in /tmp"
   echo "Please wait until after the hour"
   exit
fi

source /home/Your_User_Name/scripts/ttsvoice-definition.sh
CALLSIGN=W5HRC
DSTNODE=519403
DSTSOUNDS="/usr/local/share/asterisk/sounds"
DSTRPTSOUNDS="/usr/local/share/asterisk/sounds/rpt"
DSTLETTERS="/usr/local/share/asterisk/sounds/letters"
DSTNUMBERS="/usr/local/share/asterisk/sounds/digits"
DSTWX="/usr/local/share/asterisk/sounds/wx"

function base() {
for f in \
changing channel current-time-is node-id public-ip-address \
activated added all-circuits-busy-now call-forwarding calling call-waiting cancelled de-activated disabled \
enter-num-blacklist entr-num-rmv-blklist extension feature-not-avail-line for from-unknown-caller goodbye hello \
hours im-sorry invalid is-in-use is-set-to is location lowercase minutes minute number-not-answering one-moment-please \
please-try-again please-try-call-later pls-hold-while-try removed seconds second simul-call-limit-reached \
something-terribly-wrong sorry ss-noservice telephone-number time to-extension \
transfer uppercase with you-entered your
  do
    fx=$f
    case $f in
      "node-id")                  fx="$CALLSIGN" ;;
      "weather")                  fx="wethur" ;;
      "enter-num-blacklist")      fx="Please-enter-the-number-to-be-blacklisted" ;;
      "entr-num-rmv-blklist")     fx="Please-enter-the-number-to-be-removed-from-the-blacklist" ;;
      "feature-not-avail-line")   fx="That-feature-is-not-available-on-this-line" ;;
      "im-sorry")                 fx="eye'm-sorry" ;;
      "invalid")                  fx="eye'm-sorry,that-is-not-a-valid-extension" ;;
      "number-not-answering")     fx="The-number-is-not-answering" ;;
      "please-try-call-later")    fx="Please-try-your-call-again-later" ;;
      "pls-hold-while-try")       fx="Please-hold-while-we-try-to-connect-you" ;;
      "simul-call-limit-reached") fx="Simultaneous-call-limit-reached" ;;
      "something-terribly-wrong") fx="Something-is-terribly-wrong" ;;
      "sorry")                    fx="We're-sorry" ;;
      "ss-noservice")             fx="The-number-you-have-dialed-is-not-in-service,Please-check-the-number-and-try-again" ;;
      "to-extension")             fx="2-extension" ;;
      "transfer")                 fx="Please-hold-while-I-try-that-extension" ;;
    esac
  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE -f $DSTSOUNDS/$f
#  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE
  mv $DSTSOUNDS/$f.ul $DSTSOUNDS/$f.ulaw
  echo -n "$f "
done
echo ""
return 0
}

function rpt() {
for f in \
act-timeout-warning alllinksdisconnected alllinksrestored autopatch_on callproceeding callterminated connected connected-to \
connecting connection_failed disconnected down fast frequency functioncomplete goodafternoon goodevening goodmorning hipwr id in-call \
invalid-freq keyedfor latitude localmonitor login longitude lopwr macro_busy macro_notfound medpwr memory_notfound minus \
monitor node_enabled node off on plus quick remote_already remote_busy remote_cmd remote_disc remote_go remote_monitor \
remote_notfound remote_tx repeat_only revpatch-intro revpatch-noanswer rxpl seconds simplex sitenorm slow stop thetemperatureis \
thetimeis thevoltageis thewindis timeout timeout-warning tranceive txpl unauthtx unkeyedfor up version
  do
    fx=$f
    case $f in
      "act-timeout-warning")   fx="warning,in,activity-timeout,in" ;;
      "alllinksdisconnected")   fx="all-links-disconnected" ;;
      "alllinksrestored")   fx="all-links-restored" ;;
      "functioncomplete")   fx="function-complete" ;;
      "goodevening")   fx="good-eve-ning" ;;
      "hipwr")   fx="high,power" ;;
      "in-call")   fx="in-coming-call-on" ;;
      "invalid-freq")   fx="invalid-frequency" ;;
      "keyedfor")   fx="keyed-for" ;;
      "localmonitor")   fx="local-monitor" ;;
      "login")   fx="log-in" ;;
      "lopwr")   fx="low,power" ;;
      "macro_busy")   fx="mack,row-busy" ;;
      "medpwr")   fx="medium-power" ;;
      "remote_already")   fx="remote-already-in-this-mode" ;;
      "remote_cmd")   fx="remote_command" ;;
      "remote_disc")   fx="remote-disconnected" ;;
      "revpatch-intro")   fx="please-hold-for-a-few-moments-and-your-call-will-be-connected-if-there-is-someone-there-two-answer" ;;
      "revpatch-noanswer")   fx="we're-sorry,but-no-one-was-available-to-answer-your-call-at-this-time" ;;
      "rxpl")   fx="PL-decode" ;;
      "sitenorm")   fx="site-normal" ;;
      "thetemperatureis")   fx="the-temperature,iz" ;;
      "thetimeis")     fx="the-time-iz" ;;
      "thevoltageis")   fx="the-voltage-iz" ;;
      "thewindis")   fx="the-wind-iz" ;;
      "timeout-warning")   fx="warning,system-timeout,in" ;;
      "txpl")   fx="PL-encode" ;;
      "unauthtx")   fx="un-authorized-transmit-frequency" ;;
      "unkeyedfor")   fx="un-keyed-for" ;;
    esac
  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE -f $DSTRPTSOUNDS/$f
#  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE
  mv $DSTRPTSOUNDS/$f.ul $DSTRPTSOUNDS/$f.ulaw
  echo -n "$f "
done
echo ""
return 0
}

function numbers() {
for f in \
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 30 40 50 60 70 80 90 a-m at billion \
dollars hundred million minus oclock oh p-m pound star thousand today tomorrow yesterday
do
    fx=$f
    case $f in
      "oclock")     fx="oh-clock" ;;
    esac
  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE -f $DSTNUMBERS/$f
#  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE
  mv $DSTNUMBERS/$f.ul $DSTNUMBERS/$f.ulaw
  echo -n "$f "
done
echo ""
return 0
}

function letters() {
for f in \
asterisk at dash dollar dot equals exclamation-point plus slash space zed a b c d e f g h i j k l m n o p q r s t u v w x y z
do
    fx=$f
    case $f in
      "dollar")       fx="dll-lur" ;;
    esac
  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE -f $DSTLETTERS/$f
#  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE
  mv $DSTLETTERS/$f.ul $DSTLETTERS/$f.ulaw
  echo -n "$f "
done
echo ""
return 0
}

function weather() {
for f in \
around barometer ceiling clear cloudy conditions degrees dew-point falling feet fog foot gust gusting-to gusts gusty heat-index \
humidity inches inch kilometer large meter mist mostly northeast northwest partly percent point rain rising southeast southwest steady \
showers sunny temperature wind-chill winds temperature thunderstorm to weather
do
    fx=$f
    case $f in
      "weather")       fx="wethur" ;;
    esac
  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE -f $DSTWX/$f
#  asl-tts -n $DSTNODE -t $fx -v $TTSVOICE
  mv $DSTWX/$f.ul $DSTWX/$f.ulaw
  echo -n "$f "
done
echo ""
return 0
}

echo "Start"
if [ ! -e $DSTRPTSOUNDS ]; then
  echo "Creating dir "$DSTRPTSOUNDS
  mkdir $DSTRPTSOUNDS
fi
if [ ! -e $DSTLETTERS ]; then
  echo "Creating dir "$DSTLETTERS
  mkdir $DSTLETTERS
fi
if [ ! -e $DSTNUMBERS ]; then
  echo "Creating dir "$DSTNUMBERS
  mkdir $DSTNUMBERS
fi
if [ ! -e $DSTWX ]; then
  echo "Creating dir "$DSTWX
  mkdir $DSTWX
fi

base
rpt
numbers
letters
weather
echo "End"
