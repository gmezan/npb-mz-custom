#!/bin/bash

for b in bt-mz lu-mz sp-mz
do
	for class in S W A B C D
	do
		for nproc in 1 2 4 6 8 10 12 16
		do
			make $b CLASS=$class NPROCS=$nproc
		done	
	done
done

