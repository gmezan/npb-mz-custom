mpirun --host master,worker-1,worker-2 -np 1 bin/bt-mz.B.1 > results/bt-mz.B.1
mpirun --host master,worker-1,worker-2 -np 2 bin/bt-mz.B.2 > results/bt-mz.B.2
mpirun --host master,worker-1,worker-2 -np 4 bin/bt-mz.B.4 > results/bt-mz.B.4
mpirun --host master,worker-1,worker-2 -np 8 bin/bt-mz.B.8 > results/bt-mz.B.8
mpirun --host master,worker-1,worker-2 -np 16 bin/bt-mz.B.16 > results/bt-mz.B.16
