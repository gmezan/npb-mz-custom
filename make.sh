BENCHMARK=bt-mz

HEADER=name,nproc,mops_total,mops_thread,time_s

rm csv/*
for t in ovs sriov
do
    for class in W A B C
    do
        fname=$BENCHMARK-$class
        touch csv/$fname-$t.csv
        echo $HEADER > csv/$fname-$t.csv
        for nproc in 1 2 4 6 8 10 12 16
        do
            name=$BENCHMARK.$class.$nproc
            mops_total=$(cat results/$t/$BENCHMARK.$class.$nproc | grep "Mop/s total" | awk '{print $4}')
            mops_thread=$(cat results/$t/$BENCHMARK.$class.$nproc | grep "Mop/s/thread" | awk '{print $3}')
            time_r=$(cat results/$t/$BENCHMARK.$class.$nproc | grep "Time in" | awk '{print $5}')
            echo "$name,$nproc,$mops_total,$mops_thread,$time_r" >> csv/$fname-$t.csv
        done
    done
done
