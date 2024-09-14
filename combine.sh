num1=$(cat emcpipe/polymer.data | grep -n "LAMMPS" | grep -o '[0-9]\+')
num2=$(cat emcpipe/polymer.data | grep -n "Atoms" | grep -o '[0-9]\+')

num3=$(cat emcpipe/polymer.data | grep -n "Bonds" | grep -o '[0-9]\+')

num4=$(cat polymer_trans.data | grep -n "Atoms" | grep -o '[0-9]\+')

tail -n +$num1 'emcpipe/polymer.data' | head -n $((num2-num1)) >> combine.data

tail -n +$num 'polymer_trans.data' >> coord.txt
