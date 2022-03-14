from pickle import MARK
import re
import pandas as pd
import matplotlib.pyplot as plt

classes = ['A', 'B']
benchmarks = ['bt-mz']
types = ['sriov', 'ovs']
MARKER_SIZE=12

def get_csv_name(benchmark, type, c):
    return 'csv/' + benchmark + '-' + c + '-' + type + '.csv'

dfs = {}

for b in benchmarks:
    dfs[b] = {}
    for t in types:
        dfs[b][t] = {}
        for c in classes:
            dfs[b][t][c] = pd.read_csv(get_csv_name(b,t,c))

counter=1

plt.figure(figsize=(10, 10))

dfs_b = dfs['bt-mz']

for c in classes:
    plt.subplot(int('33' + str(counter) ))
    sriov_plt = plt.scatter(dfs_b['sriov'][c].loc[:,'nproc'], dfs_b['sriov'][c].loc[:,'time_s'], s=MARKER_SIZE)
    ovs_plt = plt.scatter(dfs_b['ovs'][c].loc[:,'nproc'], dfs_b['ovs'][c].loc[:,'time_s'], s=MARKER_SIZE)
    plt.legend((sriov_plt, ovs_plt),('sriov','ovs'))
    plt.xlabel('nproc')
    plt.ylabel('time (s)')
    plt.title('bt-mz-' + c + ' Time in Seconds')

    counter = counter + 1

    plt.subplot(int('33' + str(counter) ))
    sriov_plt = plt.scatter(dfs_b['sriov'][c].loc[:,'nproc'], dfs_b['sriov'][c].loc[:,'mops_total'], s=MARKER_SIZE)
    ovs_plt = plt.scatter(dfs_b['ovs'][c].loc[:,'nproc'], dfs_b['ovs'][c].loc[:,'mops_total'], s=MARKER_SIZE)
    plt.legend((sriov_plt, ovs_plt),('sriov','ovs'))
    plt.xlabel('nproc')
    plt.ylabel('mops total')
    plt.title('bt-mz-' + c + 'Mop/s Total')

    counter = counter + 1

    plt.subplot(int('33' + str(counter) ))
    sriov_plt = plt.scatter(dfs_b['sriov'][c].loc[:,'nproc'], dfs_b['sriov'][c].loc[:,'mops_thread'], s=MARKER_SIZE)
    ovs_plt = plt.scatter(dfs_b['ovs'][c].loc[:,'nproc'], dfs_b['ovs'][c].loc[:,'mops_thread'], s=MARKER_SIZE)
    plt.legend((sriov_plt, ovs_plt),('sriov','ovs'))
    plt.xlabel('nproc')
    plt.ylabel('mops thread')
    plt.title('bt-mz-' + c + 'Mop/s Thread')

    counter = counter + 1

plt.suptitle('Result: BT-MZ')
plt.tight_layout()
plt.show()