#!/bin/bash

# Dependencies:
# imagemagick
# swaylock
# grim

IMAGE=/tmp/swaylock.png
SCREENSHOT="grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $IMAGE"

# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5"
#BLURTYPE="0x2"
#BLURTYPE="5x2"
#BLURTYPE="2x8"
#BLURTYPE="2x3"
BLURTYPE="0x6"
# Get the screenshot, add the blur and lock the screen with it
$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
swaylock -i $IMAGE
rm $IMAGE
