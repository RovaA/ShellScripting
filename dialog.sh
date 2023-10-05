#!/bin/bash

OUTPUT="input.txt"

>$OUTPUT

function sayHello() {
	local n=${@-"anonymous person"}

	dialog --title "Hello" --clear --msgbox "Hello ${n}, let us be friends" 10 41
}

trap "rm $OUTPUT; exit" SIGHUP SIGINT SIGTERM

dialog --title "What's your name ?" \
	--backtitle "Name" \
	--inputbox "Enter your name " 8 60 2>$OUTPUT

response=$?

name=$(<$OUTPUT)

case $response in
	0)
		sayHello ${name}
		;;
	1)
		echo "Cancel pressed"
		;;
	255)
		echo "[ESC] key pressed"
esac

rm $OUTPUT
