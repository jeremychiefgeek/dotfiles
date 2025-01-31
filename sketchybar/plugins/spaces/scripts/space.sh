#!/usr/bin/env sh

update() {
  WIDTH="dynamic"
  if [ "$SELECTED" = "true" ]; then
    WIDTH="0"
  fi

  sketchybar --animate tanh 20 --set "$NAME" icon.highlight="$SELECTED" label.width="$WIDTH"

}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    # FIXME: Not sure this is necessary
    aerospace workspace "$SID"
  else
    aerospace workspace "$SID"
  fi
}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
*)
  update
  ;;
esac
