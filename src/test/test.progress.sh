#!/bin/bash

# === Log4Bash progress bar test script ===

cd `dirname $0`

source ../lib/progress4bash.sh

echo ''
echo '--------------------------------------------'
echo ' Test progress bar                          '
echo '--------------------------------------------'
echo ''


var_progress_step=0
var_progress_total=4

progress_start ${var_progress_total}
progress ${var_progress_step} ${var_progress_total} "Starting installation..."

sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Initialization..."

# 'Initialization...'
# 'doing some stuff...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Running process..."

# 'Running process...'
# 'doing some stuff 2...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Finalization..."

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

echo ''
echo '--------------------------------------------'
echo ' Test progress bar failed                   '
echo '--------------------------------------------'
echo ''


var_progress_step=0
var_progress_total=4

progress_start ${var_progress_total}

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Starting installation..."

sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Initialization..."

# 'Initialization...'
# 'doing some stuff...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Running process..."

# 'Running process...'
# 'doing some stuff 2...'
# 'Error :('
sleep 2

progress_stop

progress_msgnotok "--== Installation failed! ==--"

sleep 2

echo ''
echo ''

echo ''
echo '--------------------------------------------'
echo ' Test progress bar design alternative       '
echo '--------------------------------------------'
echo ''

progress_design='SQUARE'

var_progress_step=0
var_progress_total=4

progress_start ${var_progress_total}
progress ${var_progress_step} ${var_progress_total} "Starting installation..."

sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Initialization..."

# 'Initialization...'
# 'doing some stuff...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Running process..."

# 'Running process...'
# 'doing some stuff 2...'
sleep 2

var_progress_step=$((var_progress_step+1))
progress ${var_progress_step} ${var_progress_total} "Finalization..."

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

echo ''
echo '--------------------------------------------'
echo ' Test progress bar more control             '
echo '--------------------------------------------'
echo ''

progress_design='SQUARE'

var_progress_total=100

progress_start ${var_progress_total}
progress 0 ${var_progress_total} "Starting installation..."

sleep 2

progress 5 ${var_progress_total} "Initialization..."

# 'Initialization...'
# 'doing some stuff...'
sleep 2

progress 25 ${var_progress_total} "Running process..."

# 'Running process...'
# 'doing some stuff 2...'
sleep 2

progress 90 ${var_progress_total} "Finalization..."

# 'Finalization...'
# 'doing some stuff 3...'
sleep 2

progress 100 ${var_progress_total}
progress_stop

progress_msgok "--== Installation succeeded! ==--"

sleep 2

echo ''
echo ''

echo ''
echo '--------------------------------------------'
echo ' Test progress bar custom title             '
echo '--------------------------------------------'
echo ''

progress_design='SQUARE'
progress_title='Installation of service ABC: '

var_progress_total=100

progress_start ${var_progress_total}
progress 0 ${var_progress_total} "Starting installation of ABC service..."

sleep 2

progress 5 ${var_progress_total} "Initialization..."

# 'Initialization...'
# 'doing some stuff...'
sleep 2

progress 25 ${var_progress_total} "Running process..."

# 'Running process...'
# 'doing some stuff 2...'
sleep 2

progress 90 ${var_progress_total} "Finalization..."

# 'Finalization...'
# 'doing some stuff 3...'
sleep 2

progress 100 ${var_progress_total}
progress_stop

progress_msgok "--== Installation succeeded! ==--"

sleep 2

echo ''
echo ''

