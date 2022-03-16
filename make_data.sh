#!/bin/bash

HEADER=name,nproc,mops_total,mops_thread,time_s

labels=(sriov ovs)
benchmarks=(bt-mz lu-mz sp-mz)
classes=(W A B C)
nprocs=(1 2 4 6 8 10 12 16)

rm csv/*
for t in "${labels[@]}"
do
	for b in "${benchmarks[@]}"
	do
        for class in "${classes[@]}"
        do
            fname=$b-$class
            touch csv/$fname-$t.csv
            echo $HEADER > csv/$fname-$t.csv
            
            for nproc in "${nprocs[@]}"
            do
                name=$b.$class.$nproc
                mops_total=$(cat results/$t/$b.$class.$nproc | grep "Mop/s total" | awk '{print $4}')
                mops_thread=$(cat results/$t/$b.$class.$nproc | grep "Mop/s/thread" | awk '{print $3}')
                time_r=$(cat results/$t/$b.$class.$nproc | grep "Time in" | awk '{print $5}')
                echo "$name,$nproc,$mops_total,$mops_thread,$time_r" >> csv/$fname-$t.csv
            done
        done
    done
done
