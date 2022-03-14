
BENCHMARK=bt-mz

for class in S W A B
do
	for nproc in 1 2 4 6 8 10 12 16
	do
		make $BENCHMARK CLASS=$class NPROCS=$nproc
	done	
done

