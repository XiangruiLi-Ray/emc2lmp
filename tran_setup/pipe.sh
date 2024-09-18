#!/bin/bash
set -e

echo 'Running Setup'
emc_setup.pl 'tran_polymer.esh'
echo 'Setup done'

echo 'Running Build'
emc_linux_x86_64 'build.emc'
echo 'Build done'

#store parameters
num=$(cat tran_polymer.params | grep -n 'Pair Coeffs' | grep -o '[0-9]\+')
tail -n +$num 'tran_polymer.params' > coeffs.txt

#relaxation might not be so useful
echo 'Running Relaxation'
lmp -in relax.in
echo 'Relaxation done'

