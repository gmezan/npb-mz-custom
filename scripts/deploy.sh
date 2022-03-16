#!/bin/bash

HOSTFILE=../hostfile
RESULTS=../results
BIN=../bin

labels=(sriov ovs)
benchmarks=(bt-mz lu-mz sp-mz)
classes=(W A B C)
nprocs=(1 2 4 6 8 10 12 16)

# Running al benchmarks

for l in "${labels[@]}"
do
	mkdir -p $RESULTS/$l
	bash ../cluster-scripts/${l}_set_net.sh
	sleep 5

	for b in "${benchmarks[@]}"
	do
		for c in "${classes[@]}"
		do
			for nproc in "${nprocs[@]}"
			do
				echo "> Running $l/$b.$c.$nproc"
				#mpirun --hostfile $HOSTFILE -np $nproc $BIN/$b.$c.$nproc > $RESULTS/$l/$b.$c.$nproc
				sleep 2
			done
		done
	done
done

