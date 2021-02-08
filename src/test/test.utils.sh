#!/bin/bash

# === Log4Bash progress bar test script ===

cd `dirname $0`

source ../lib/progress4bash.sh
source ../lib/utils4bash.sh


echo ''
echo '--------------------------------------------'
echo ' Test sudo prompt                           '
echo '--------------------------------------------'
echo ''

utils_sudo_prompt

echo ''
echo '--------------------------------------------'
echo ' Test progress bar with sudo right oper.    '
echo '--------------------------------------------'
echo ''


var_progress_step=0
var_progress_total=4

progress_start ${var_progress_total}
progress ${var_progress_step} ${var_progress_total} "Starting installation..."

sudo -l > /dev/null
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Initialization..."

# 'Initialization...'
# 'doing some stuff...'
sudo -l > /dev/null
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Running process..."

# 'Running process...'
# 'doing some stuff 2...'
sudo -l > /dev/null
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Finalization..."

sudo -l > /dev/null
# 'Finalization...'
# 'doing some stuff 3...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total}
progress_stop

progress_msgok "--== Installation succeeded! ==--"

sleep 2

echo ''
echo ''
