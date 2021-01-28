#!/bin/bash

# === Log4Bash progress bar test script ===

cd `dirname $0`

source ../lib/log4bash.sh
source ../lib/progress4bash.sh

echo ''
echo '--------------------------------------------'
echo ' Test progress bar                          '
echo '--------------------------------------------'
echo ''

#initialization of log
log_level='TRACE'
log_appender='FILE'
log_file="../log/test.log4bash-"$(date '+%Y%m%d_%H%M%S')".log"


var_progress_step=0
var_progress_total=4

progress_start ${var_progress_total}
progress ${var_progress_step} ${var_progress_total} "Starting installation..."

sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Initialization..."

log_info 'Initialization...'
log_trace 'doing some stuff...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Running process..."

log_info 'Running process...'
log_trace 'doing some stuff 2...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Finalization..."

log_info 'Finalization...'
log_trace 'doing some stuff 3...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total}
progress_stop

progress_msgok "--== Installation succeeded! ==--"

sleep 2

echo ''
echo ''
echo "Content of log file (${log_file}):"
less -FX "${log_file}"

echo ''
echo ''

echo ''
echo '--------------------------------------------'
echo ' Test progress bar failed                   '
echo '--------------------------------------------'
echo ''

log_file="../log/test.log4bash-"$(date '+%Y%m%d_%H%M%S')".log"


var_progress_step=0
var_progress_total=4

progress_start ${var_progress_total}

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Starting installation..."

sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Initialization..."

log_info 'Initialization...'
log_trace 'doing some stuff...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Running process..."

log_info 'Running process...'
log_trace 'doing some stuff 2...'
log_error 'Error :('
sleep 2

progress_stop

progress_msgnotok "--== Installation failed (see logs files for details) ==--"

sleep 2

echo ''
echo ''
echo "Content of log file (${log_file}):"
less -FX "${log_file}"

echo ''
echo ''

echo ''
echo '--------------------------------------------'
echo ' Test progress bar design alternative       '
echo '--------------------------------------------'
echo ''

progress_design='SQUARE'

log_file="../log/test.log4bash-"$(date '+%Y%m%d_%H%M%S')".log"

var_progress_step=0
var_progress_total=4

progress_start ${var_progress_total}
progress ${var_progress_step} ${var_progress_total} "Starting installation..."

sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Initialization..."

log_info 'Initialization...'
log_trace 'doing some stuff...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Running process..."

log_info 'Running process...'
log_trace 'doing some stuff 2...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Finalization..."

log_info 'Finalization...'
log_trace 'doing some stuff 3...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total}
progress_stop

progress_msgok "--== Installation succeeded! ==--"

sleep 2

echo ''
echo ''
echo "Content of log file (${log_file}):"
less -FX "${log_file}"

echo ''
echo ''

echo ''
echo '--------------------------------------------'
echo ' Test progress bar more control             '
echo '--------------------------------------------'
echo ''

progress_design='SQUARE'

log_file="../log/test.log4bash-"$(date '+%Y%m%d_%H%M%S')".log"

var_progress_total=100

progress_start ${var_progress_total}
progress 0 ${var_progress_total} "Starting installation..."

sleep 2

progress 5 ${var_progress_total} "Initialization..."

log_info 'Initialization...'
log_trace 'doing some stuff...'
sleep 2

progress 25 ${var_progress_total} "Running process..."

log_info 'Running process...'
log_trace 'doing some stuff 2...'
sleep 2

progress 90 ${var_progress_total} "Finalization..."

log_info 'Finalization...'
log_trace 'doing some stuff 3...'
sleep 2

progress 100 ${var_progress_total}
progress_stop

progress_msgok "--== Installation succeeded! ==--"

sleep 2

echo ''
echo ''
echo "Content of log file (${log_file}):"
less -FX "${log_file}"

echo ''
echo ''

