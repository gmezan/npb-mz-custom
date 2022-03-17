#!/bin/bash

HOSTFILE=../hostfile
RESULTS=../results
BIN=../bin

source ./config.sh

# Running al benchmarks

rm -rf $RESULTS/*

for l in "${labels[@]}"
do
	mkdir -p $RESULTS/$l
	bash ../cluster-scripts/${l}_set_net.sh
	sleep 3

	for b in "${benchmarks[@]}"
	do
		for c in "${classes[@]}"
		do
			for nproc in "${nprocs[@]}"
			do
				echo "> Running $l/$b.$c.$nproc"
				mpirun --hostfile $HOSTFILE -np $nproc $BIN/$b.$c.$nproc > $RESULTS/$l/$b.$c.$nproc
				sleep 1
			done
		done
	done
done

