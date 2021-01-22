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

log_red_command=`tput setaf 1`
log_green_command=`tput setaf 2`
log_yellow_command=`tput setaf 3`
log_magenta_command=`tput setaf 5`
log_cyan_command=`tput setaf 6`
log_reset_command=`tput sgr0`

log_bold=`tput bold`
log_normal=`tput sgr0`

log_trace() {
	if [ "$log_level" == "TRACE" ]; then
		echo $(date "${log_date_format}")" [TRACE] "$1
	fi
}

log_debug() {
	if [ "$log_level" == "TRACE" ] || [ "$log_level" == "DEBUG" ]; then
		echo $(date "${log_date_format}")" ${log_magenta_command}[DEBUG] ${log_reset_command}"$1
	fi
}

log_info() {
	if [ "$log_level" == "TRACE" ] || [ "$log_level" == "DEBUG" ] || [ "$log_level" == "INFO" ]; then
		echo $(date "${log_date_format}")" ${log_cyan_command}[INFO]  ${log_reset_command}"$1
	fi
}

log_warn() {
	if [ "$log_level" == "TRACE" ] || [ "$log_level" == "DEBUG" ] || [ "$log_level" == "INFO" ] || [ "$log_level" == "WARN" ]; then
		echo $(date "${log_date_format}")" ${log_yellow_command}[WARN]  ${log_reset_command}"$1
	fi
}

log_error() {
	if [ "$log_level" == "TRACE" ] || [ "$log_level" == "DEBUG" ] || [ "$log_level" == "INFO" ] || [ "$log_level" == "WARN" ] || [ "$log_level" == "ERROR" ]; then
		echo $(date "${log_date_format}")" ${log_red_command}[ERROR] ${log_reset_command}"$1
	fi
}

log_fatal() {
	echo $(date "${log_date_format}")" ${log_red_command}${log_bold}[FATAL] ${log_reset_command}"$1
}

log_msgok() {
	echo $(date "${log_date_format}")" ${log_green_command}"$1"${log_reset_command}"
}

log_msgnotok() {
	echo $(date "${log_date_format}")" ${log_red_command}"$1"${log_reset_command}"
}

