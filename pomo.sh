#!/bin/bash

WORK_DURATION=1500
SHORT_BREAK_DURATION=300
LONG_BREAK_DURATION=1800
SESSIONS_BEFORE_LONG_BREAK=4

session_count=0

notify(){
	terminal-notifier -message "$1" -title "$3" -sound Crytsal
}

while true; do
	notify "Work sesssion started" "Pomodoro"
	timer $WORK_DURATION
	session_count=$((session_count + 1))

	if ((session_count % SESSIONS_BEFORE_LONG_BREAK == 0)); then
		notify "Long Break Began" "Pomodoro"
		timer $LONG_BREAK_DURATION
	else
		notify "Break time" "Pomodoro"
		timer $SHORT_BREAK_DURATION
	fi

done


