#!/bin/bash

# === Log4Bash test script ===

cd `dirname $0`

source ../lib/log4bash.sh

function displayAllLogs() {

	log_trace 'This is a Trace Test!'
	log_debug 'This is a Debug Test!'
	log_info 'This is a Info Test!'
	log_warn 'This is a Warn Test!'
	log_error 'This is a Error Test!'
	log_fatal 'This is a Fatal Test!'

}

echo ''
echo '--------------------------------------------'
echo ' Test with default log level                '
echo '--------------------------------------------'

displayAllLogs


echo ''
echo '--------------------------------------------'
echo ' Test with log level TRACE                  '
echo '--------------------------------------------'

log_level='TRACE'

displayAllLogs

echo ''
echo '--------------------------------------------'
echo ' Test with log level DEBUG                  '
echo '--------------------------------------------'

log_level='DEBUG'

displayAllLogs

echo ''
echo '--------------------------------------------'
echo ' Test with log level INFO                   '
echo '--------------------------------------------'

log_level='INFO'

displayAllLogs

echo ''
echo '--------------------------------------------'
echo ' Test with log level WARN                   '
echo '--------------------------------------------'

log_level='WARN'

displayAllLogs

echo ''
echo '--------------------------------------------'
echo ' Test with log level ERROR                  '
echo '--------------------------------------------'

log_level='ERROR'

displayAllLogs

echo ''
echo '--------------------------------------------'
echo ' Test with log level FATAL                  '
echo '--------------------------------------------'

log_level='FATAL'

displayAllLogs


echo ''
echo '--------------------------------------------'
echo ' Test with custom date formats              '
echo '--------------------------------------------'

log_level='TRACE'
log_date_format='+%Y-%m-%d %I:%M:%S %p'

displayAllLogs

log_date_format='+%Hh%M and %Ss on %A %d/%m/%Y'

displayAllLogs

echo ''
echo '--------------------------------------------'
echo ' Test with appenders CONSOLE and FILE       '
echo '--------------------------------------------'
log_date_format='+%d/%m/%Y %H:%M:%S'

log_appender='CONSOLE,FILE'
log_file="../log/test.log4bash-"$(date '+%Y%m%d_%H%M%S')".log"

displayAllLogs

echo ''
echo ''
echo "Content of log file (${log_file}):"
less -FX "${log_file}"

echo ''
echo ''

