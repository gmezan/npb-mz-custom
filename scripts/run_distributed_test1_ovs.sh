mpirun --host master0,worker0,worker1 -np 1 bin/bt-mz.A.1 > results/bt-mz.A.1-ovs
mpirun --host master0,worker0,worker1 -np 2 bin/bt-mz.A.2 > results/bt-mz.A.2-ovs
mpirun --host master0,worker0,worker1 -np 4 bin/bt-mz.A.4 > results/bt-mz.A.4-ovs
mpirun --host master0,worker0,worker1 -np 8 bin/bt-mz.A.8 > results/bt-mz.A.8-ovs
mpirun --host master0,worker0,worker1 -np 16 bin/bt-mz.A.16 > results/bt-mz.A.16-ovs
