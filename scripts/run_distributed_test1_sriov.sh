mpirun --host master0,worker0,worker1 -np 1 bin/bt-mz.A.1 > results/bt-mz.A.1-sriov
mpirun --host master0,worker0,worker1 -np 2 bin/bt-mz.A.2 > results/bt-mz.A.2-sriov
mpirun --host master0,worker0,worker1 -np 4 bin/bt-mz.A.4 > results/bt-mz.A.4-sriov
mpirun --host master0,worker0,worker1 -np 8 bin/bt-mz.A.8 > results/bt-mz.A.8-sriov
mpirun --host master0,worker0,worker1 -np 16 bin/bt-mz.A.16 > results/bt-mz.A.16-sriov
