#!/usr/bin/env bash

FRONT_APP_SCRIPT='sketchybar --set "$NAME" label="$INFO"'

system_aerospace=(
  script="$PLUGIN_DIR/front-app/scripts/aerospace.sh"
  icon.font="$FONT:Bold:16.0"
  label.drawing=off
  icon.width=30
  icon="$AEROSPACE_GRID"
  icon.color="$PEACH"
  associated_display=active
)

front_app=(
  script="$FRONT_APP_SCRIPT"
  icon.drawing=off
  background.padding_left=0
  label.color="$TEXT"
  label.font="$FONT:Black:12.0"
  associated_display=active
)

sketchybar --add event window_focus \
  --add event windows_on_spaces \
  --add item system.aerospace left \
  --set system.aerospace "${system_aerospace[@]}" \
  --subscribe system.aerospace window_focus \
  windows_on_spaces \
  mouse.clicked \
  \
  --add item front_app left \
  --set front_app "${front_app[@]}" \
  --subscribe front_app front_app_switched
