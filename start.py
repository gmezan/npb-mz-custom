import pandas as pd
import matplotlib.pyplot as plt
import subprocess

classes = ['A', 'B', 'C']
benchmarks = ['bt-mz']
types = ['sriov', 'ovs']

# Generate CSV files with raw data
bashCommand = "bash make_data.sh"
process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
output, error = process.communicate()


LINEWIDTH=1

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
    for i in ['mops_total','mops_thread','time_s']:
        plt.subplot(int('33' + str(counter) ))
        sriov_plt = plt.plot(dfs_b['sriov'][c].loc[:,'nproc'], dfs_b['sriov'][c].loc[:,i], '-o', linewidth=LINEWIDTH)
        ovs_plt = plt.plot(dfs_b['ovs'][c].loc[:,'nproc'], dfs_b['ovs'][c].loc[:,i], '-o', linewidth=LINEWIDTH)
        plt.legend(['sriov','ovs'])
        plt.xlabel('nproc')
        plt.ylabel(i)
        plt.title('bt-mz-' + c + ' ' + i)
        counter = counter + 1

plt.suptitle('Result: BT-MZ')
plt.tight_layout()
plt.show()