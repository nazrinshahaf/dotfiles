#!/usr/bin/env zsh

ICON_FONT="JetBrainsMono Nerd Font Mono"
LABEL_FONT="JetBrainsMono Nerd Font"

update_space() {
    SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

    case $SPACE_ID in
    1)
        ICON=󰅶
        ICON_PADDING_LEFT=7
        ICON_PADDING_RIGHT=7
		FONT="$ICON_FONT:Bold:22.0"
        ;;
    *)
        ICON=$SPACE_ID
        ICON_PADDING_LEFT=9
        ICON_PADDING_RIGHT=10
		FONT="$ICON_FONT:Bold:15.0"
        ;;
    esac

    sketchybar --set $NAME \
        icon=$ICON \
        icon.padding_left=$ICON_PADDING_LEFT \
        icon.padding_right=$ICON_PADDING_RIGHT \
		icon.font="$FONT"
}

case "$SENDER" in
"mouse.clicked")
    # Reload sketchybar
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    ;;
*)
    update_space
    ;;
esac
