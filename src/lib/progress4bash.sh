#!/bin/bash

# === Bash library to display progress bar ===
# author: Steve Leroy
# ============================================
# Usage:
# progress_start maxvalue
# progress value maxvalue message
# progress_stop
#
# progress_msgok message
# progress_msgnotok message

progress_title='Progress: '

# can be HASH or SQUARE
progress_design='HASH'

progress_red_command=`tput setaf 1`
progress_green_command=`tput setaf 2`
progress_reset_command=`tput sgr0`

progress_bold=`tput bold`
progress_normal=`tput sgr0`

progress_previousline_command=`tput cuu1`
progress_eraseline_command=`tput el`


function progress {
	# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
	# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

	# 1.2 Build progressbar strings and print the ProgressBar line
	# 1.2.1 Output example:                           
	# 1.2.1.1 Progress : [########################################] 100%
	if [[ $progress_design == "HASH" ]]; then
		printf "\r${progress_title}[${_fill// /#}${_empty// /-}] ${_progress}%%"
	fi
	if [[ $progress_design == "SQUARE" ]]; then
		printf "\r${progress_title}|${_fill// /▇}${_empty// /-}| ${_progress}%%"
	fi
	printf "\n\n${progress_eraseline_command}           ${3} ${progress_previousline_command}${progress_previousline_command}\r"

}

progress_start() {
	progress 0 ${1} ""
}

progress_stop() {
	printf "\n\n\r${progress_eraseline_command}\n"
}

progress_msgok() {
	echo "           ${progress_green_command}${1}${progress_reset_command}"
}

progress_msgnotok() {
	echo "           ${progress_red_command}${1}${progress_reset_command}"
}