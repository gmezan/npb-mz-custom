

LABEL=$1
HOSTFILE=../hostfile
RESULTS=../results
BIN=../bin
BENCHMARK=bt-mz
CLASS=$2

for nproc in 1 2 4 6 8 10 12 16
do
	mpirun --hostfile $HOSTFILE -np $nproc $BIN/$BENCHMARK.$CLASS.$nproc > $RESULTS/$LABEL/$BENCHMARK.$CLASS.$nproc
done


