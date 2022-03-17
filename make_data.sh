#!/bin/bash

HEADER=name,nproc,mops_total,mops_thread,time_s

source ./scripts/config.sh

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
