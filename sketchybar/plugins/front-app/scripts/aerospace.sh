#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

window_state() {
  # Query Windows
  # WINDOW=$(yabai -m query --windows --window)
  WINDOW=$(aerospace list-windows --focused --json)
  CURRENT=0
  #$(echo "$WINDOW" | jq '.["stack-index"]')

  args=()
  if [[ $CURRENT -gt 0 ]]; then
    args+=(--set "$NAME" icon="$AEROSPACE_STACK" icon.color="$RED" label.drawing=on label="$(printf "[%s]" "$CURRENT")")
  else
    args+=(--set "$NAME" label.drawing=off)
    case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
    "false")
      if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
        args+=(--set "$NAME" icon="$AEROSPACE_FULLSCREEN_ZOOM" icon.color="$GREEN")
      elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
        args+=(--set "$NAME" icon="$AEROSPACE_PARENT_ZOOM" icon.color="$BLUE")
      else
        args+=(--set "$NAME" icon="$AEROSPACE_GRID" icon.color="$PEACH")
      fi
      ;;
    "true")
      args+=(--set "$NAME" icon="$AEROSPACE_FLOAT" icon.color="$MAROON")
      ;;
    esac
  fi

  sketchybar -m "${args[@]}"
}

windows_on_spaces() {
  CURRENT_SPACES="$(aerospace list-workspaces --all)"

  args=()
  while read -r line; do
    for space in "${line[@]}"; do
      icon_strip=" "
      apps=$(aerospace list-windows --workspace "$space" --json | jq -r '.[]."app-name"')
      if [ "$apps" != "" ]; then
        while IFS= read -r app; do
          icon_strip+=" $("$PLUGIN_DIR/spaces/scripts/icon_map.sh" "$app")"
        done <<<"$apps"
      fi
      args+=(--set space."$space" label="$icon_strip" label.drawing=on)
    done
  done <<<"$CURRENT_SPACES"

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  window_state
}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
"forced")
  exit 0
  ;;
"window_focus")
  window_state
  ;;
"windows_on_spaces") #windows_on_spaces # Uncomment if you want to display icons for open applications
  ;;
esac
