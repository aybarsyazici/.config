#!/bin/sh
source "$HOME/.config/sketchybar/colors.sh"

render_bar_item(){
  if [[ $CHARGING != "" ]]; then
		case ${BATT_PERCENT} in
		100) ICON="" COLOR="$GREEN" ;;
		9[0-9]) ICON="" COLOR="$GREEN" ;;
		8[0-9]) ICON="" COLOR="$GREEN" ;;
		7[0-9]) ICON="" COLOR="$GREEN" ;;
		6[0-9]) ICON="" COLOR="$YELLOW" ;;
		5[0-9]) ICON="" COLOR="$YELLOW" ;;
		4[0-9]) ICON="" COLOR="$PEACH" ;;
		3[0-9]) ICON="" COLOR="$PEACH" ;;
		2[0-9]) ICON="" COLOR="$RED" ;;
		1[0-9]) ICON="" COLOR="$RED" ;;
		*) ICON="" COLOR="$RED" ;;
		esac
  else
  	case ${BATT_PERCENT} in
	100) ICON="" COLOR="$GREEN" ;;
	9[0-9]) ICON="" COLOR="$GREEN" ;;
	8[0-9]) ICON="" COLOR="$GREEN" ;;
	7[0-9]) ICON="" COLOR="$GREEN" ;;
	6[0-9]) ICON="" COLOR="$YELLOW" ;;
	5[0-9]) ICON="" COLOR="$YELLOW" ;;
	4[0-9]) ICON="" COLOR="$PEACH" ;;
	3[0-9]) ICON="" COLOR="$PEACH" ;;
	2[0-9]) ICON="" COLOR="$RED" ;;
	1[0-9]) ICON="" COLOR="$RED" ;;
	*) ICON="" COLOR="$RED" ;;
	esac
  fi
  
	sketchybar --set "${NAME}" icon="${ICON}" icon.color="${COLOR}"
}

render_popup() {
	battery_details=(
		label="${BATT_PERCENT}%"
	)
	sketchybar -m --set battery.details "${battery_details[@]}"
}

popup() {
	sketchybar --set "$NAME" popup.drawing="$1"
}

update() {
	BATT_COMMAND=$(pmset -g batt)
	BATT_PERCENT=$(echo "$BATT_COMMAND" | grep -Eo "\d+%" | cut -d% -f1)
	CHARGING=$(echo "$BATT_COMMAND" | grep 'AC Power')

	render_bar_item
	render_popup
}

case "$SENDER" in
"routine" | "forced")
	update
	;;
"mouse.entered")
	popup on
	;;
"mouse.exited" | "mouse.exited.global")
	popup off
	;;
"mouse.clicked")
	popup toggle
	;;
esac
