#!/bin/bash

# === Bash library to log messages ===
# author: Steve Leroy
# ====================================
# Usage:
# log_trace message
# log_debug message
# log_info message
# log_warn message
# log_error message
# log_fatal message
#
# log_msgok message
# log_msgerror message

log_level='INFO'
log_date_format='+%d/%m/%Y %H:%M:%S'

log_appender='CONSOLE'
log_file=''



log_red_command=`tput setaf 1`
log_green_command=`tput setaf 2`
log_yellow_command=`tput setaf 3`
log_magenta_command=`tput setaf 5`
log_cyan_command=`tput setaf 6`
log_reset_command=`tput sgr0`

log_bold=`tput bold`
log_normal=`tput sgr0`

log_previousline_command=`tput cuu1`
log_eraseline_command=`tput el`


log_trace() {
	if [ "$log_level" == "TRACE" ]; then
		if [[ $log_appender == *"CONSOLE"* ]]; then
			echo $(date "${log_date_format}")" [TRACE] ${1}"
		fi
		if [[ $log_appender == *"FILE"* ]]; then
			echo $(date "${log_date_format}")" [TRACE] ${1}" >> "${log_file}"
		fi
	fi
}

log_debug() {
	if [ "$log_level" == "TRACE" ] || [ "$log_level" == "DEBUG" ]; then
		if [[ $log_appender == *"CONSOLE"* ]]; then
			echo $(date "${log_date_format}")" ${log_magenta_command}[DEBUG] ${log_reset_command}${1}"
		fi
		if [[ $log_appender == *"FILE"* ]]; then
			echo $(date "${log_date_format}")" [DEBUG] ${1}" >> "${log_file}"
		fi
	fi
}

log_info() {
	if [ "$log_level" == "TRACE" ] || [ "$log_level" == "DEBUG" ] || [ "$log_level" == "INFO" ]; then
		if [[ $log_appender == *"CONSOLE"* ]]; then
			echo $(date "${log_date_format}")" ${log_cyan_command}[INFO]  ${log_reset_command}${1}"
		fi
		if [[ $log_appender == *"FILE"* ]]; then
			echo $(date "${log_date_format}")" [INFO]  ${1}" >> "${log_file}"
		fi
	fi
}

log_warn() {
	if [ "$log_level" == "TRACE" ] || [ "$log_level" == "DEBUG" ] || [ "$log_level" == "INFO" ] || [ "$log_level" == "WARN" ]; then
		if [[ $log_appender == *"CONSOLE"* ]]; then
			echo $(date "${log_date_format}")" ${log_yellow_command}[WARN]  ${log_reset_command}${1}"
		fi
		if [[ $log_appender == *"FILE"* ]]; then
			echo $(date "${log_date_format}")" [WARN]  ${1}" >> "${log_file}"
		fi
	fi
}

log_error() {
	if [ "$log_level" == "TRACE" ] || [ "$log_level" == "DEBUG" ] || [ "$log_level" == "INFO" ] || [ "$log_level" == "WARN" ] || [ "$log_level" == "ERROR" ]; then
		if [[ $log_appender == *"CONSOLE"* ]]; then
			echo $(date "${log_date_format}")" ${log_red_command}[ERROR] ${log_reset_command}${1}"
		fi
		if [[ $log_appender == *"FILE"* ]]; then
			echo $(date "${log_date_format}")" [ERROR] ${1}" >> "${log_file}"
		fi
	fi
}

log_fatal() {
	if [[ $log_appender == *"CONSOLE"* ]]; then
		echo $(date "${log_date_format}")" ${log_red_command}${log_bold}[FATAL] ${log_reset_command}${1}"
	fi
	if [[ $log_appender == *"FILE"* ]]; then
		echo $(date "${log_date_format}")" [FATAL] ${1}" >> "${log_file}"
	fi
}

log_msgok() {
	if [[ $log_appender == *"CONSOLE"* ]]; then
		echo "${log_green_command}${1}${log_reset_command}"
	fi
	if [[ $log_appender == *"FILE"* ]]; then
		echo $1 >> "${log_file}"
	fi
}

log_msgnotok() {
	if [[ $log_appender == *"CONSOLE"* ]]; then
		echo "${log_red_command}${1}${log_reset_command}"
	fi
	if [[ $log_appender == *"FILE"* ]]; then
		echo $1 >> "${log_file}"
	fi
}

