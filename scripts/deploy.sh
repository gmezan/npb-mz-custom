bash /home/ubuntu/Desktop/sharedfolder/scripts/ovs_set_net.sh

bash start_distributed_test.sh ovs W
bash start_distributed_test.sh ovs A
bash start_distributed_test.sh ovs B
bash start_distributed_test.sh ovs C

bash /home/ubuntu/Desktop/sharedfolder/scripts/sriov_set_net.sh

bash start_distributed_test.sh sriov W
bash start_distributed_test.sh sriov A
bash start_distributed_test.sh sriov B
bash start_distributed_test.sh sriov C

