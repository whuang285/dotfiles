#!/bin/bash

# Defaults
# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
BLURTYPE="0x8"

IMAGE_RE="([0-9]+)x([0-9]+)"
FOLDER="$(dirname "$(readlink -f "$0")")"
LOCK="$FOLDER/lock.png"
TEXT="$FOLDER/text.png"
PARAMS=""
OUTPUT_IMAGE="/tmp/swaylock.png"
DISPLAY_TEXT=false
PIXELATE=false

# Read user input
POSITIONAL=()
while [[ $# -gt 0 ]]
do
  key="$1"

  case $key in
  -n|--no-text)
    DISPLAY_TEXT=false
    shift # past argument
    ;;
  -p|--pixelate)
    PIXELATE=true
    shift # past argument
    ;;
  *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
  esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

#Get dimensions of the lock image:
LOCK_IMAGE_INFO=`identify $LOCK`
[[ $LOCK_IMAGE_INFO =~ $IMAGE_RE ]]
IMAGE_WIDTH=${BASH_REMATCH[1]}
IMAGE_HEIGHT=${BASH_REMATCH[2]}

if $DISPLAY_TEXT ; then
  #Get dimensions of the text image:
  TEXT_IMAGE_INFO=`identify $TEXT`
  [[ $TEXT_IMAGE_INFO =~ $IMAGE_RE ]]
  TEXT_WIDTH=${BASH_REMATCH[1]}
  TEXT_HEIGHT=${BASH_REMATCH[2]}
fi

#Execute xrandr to get information about the monitors:
while read LINE
do
  #Extract information and append some parameters to the ones that will be given to ImageMagick:
  NAME=`echo $LINE | jq -r '.name'`
  WIDTH=`echo $LINE | jq '.rect.width'`
  HEIGHT=`echo $LINE | jq '.rect.height'`
  X=0
  Y=0
  POS_X=$(($X+$WIDTH/2-$IMAGE_WIDTH/2))
  POS_Y=$(($Y+$HEIGHT/2-$IMAGE_HEIGHT/2))
  LOCK_PARAMS=" $LOCK_PARAMS --image $NAME:$OUTPUT_IMAGE.$NAME.png"
  PARAMS=" '$LOCK' '-geometry' '+$POS_X+$POS_Y' '-composite'"

  if $DISPLAY_TEXT ; then
      TEXT_X=$(($X+$WIDTH/2-$TEXT_WIDTH/2))
      TEXT_Y=$(($Y+$HEIGHT/2-$TEXT_HEIGHT/2+200))
      PARAMS="$PARAMS '$TEXT' '-geometry' '+$TEXT_X+$TEXT_Y' '-composite'"
  fi
  grim -o $NAME $OUTPUT_IMAGE.$NAME.png
  
  #Execute ImageMagick:
  if $PIXELATE ; then
    PARAMS="'$OUTPUT_IMAGE.$NAME.png' '-scale' '10%' '-scale' '1000%' $PARAMS '$OUTPUT_IMAGE.$NAME.png'"
  else
    PARAMS="'$OUTPUT_IMAGE.$NAME.png' '-blur' '$BLURTYPE' $PARAMS '$OUTPUT_IMAGE.$NAME.png'"
  fi
  eval convert $PARAMS
done <<<"`swaymsg -t get_outputs | jq -c .[]`"

#eval convert $PARAMS

#Lock the screen:
swaylock -t $LOCK_PARAMS


#Remove the generated image:
rm $OUTPUT_IMAGE
rm "$OUTPUT_IMAGE"*.png 
