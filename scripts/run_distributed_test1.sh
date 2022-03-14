

LABEL=$1
HOSTFILE=../hostfile
RESULTS=../results
BIN=../bin

mpirun --hostfile $HOSTFILE -np 1 $BIN/bt-mz.A.1 > $RESULTS/bt-mz.A.1
mpirun --hostfile $HOSTFILE -np 2 $BIN/bt-mz.A.2 > $RESULTS/bt-mz.A.2
mpirun --hostfile $HOSTFILE -np 4 $BIN/bt-mz.A.4 > $RESULTS/bt-mz.A.4
mpirun --hostfile $HOSTFILE -np 8 $BIN/bt-mz.A.8 > $RESULTS/bt-mz.A.8
mpirun --hostfile $HOSTFILE -np 16 $BIN/bt-mz.A.16 > $RESULTS/bt-mz.A.16
