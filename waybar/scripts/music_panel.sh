#!/bin/bash

CURRENT_SONG="$HOME/.config/waybar/scripts/spotify.sh"

zscroll -p " | " --delay 0.2 \
    --length 40 \
    --match-command "playerctl -p cider status" \
    --match-text "Playing" "--before-text '<span syle=\"color:#1DB954\">󰓇</span> '" \
    --match-text "Paused" "--before-text ' ' --scroll 0" \
    --update-check true $CURRENT_SONG
