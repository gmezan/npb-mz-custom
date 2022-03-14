bash ../cluster-scripts/ovs_set_net.sh

BENCHMARK=bt-mz

bash start_distributed_test.sh ovs $BENCHMARK W
#bash start_distributed_test.sh ovs $BENCHMARK A
#bash start_distributed_test.sh ovs $BENCHMARK B
#bash start_distributed_test.sh ovs $BENCHMARK C

bash ../cluster-scripts/sriov_set_net.sh

bash start_distributed_test.sh sriov $BENCHMARK W
#bash start_distributed_test.sh sriov $BENCHMARK A
#bash start_distributed_test.sh sriov $BENCHMARK B
#bash start_distributed_test.sh sriov $BENCHMARK C

