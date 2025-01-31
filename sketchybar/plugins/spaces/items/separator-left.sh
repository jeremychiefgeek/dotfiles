#!/bin/bash

separator_left=(
  icon=
  icon.font="$NERD_FONT:Regular:16.0"
  background.padding_left=10
  background.padding_right=10
  label.drawing=off
  associated_display=active
  click_script='aerospace list-workspaces --monitor focused --empty no | aerospace workspace --wrap-around next
                sketchybar --trigger space_change'
  icon.color="$TEXT"
)

sketchybar --add item separator_left left \
  --set separator_left "${separator_left[@]}"
