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

plot_size = 3
width = 3 * 3 + 1
height = len(classes) * plot_size + 1

for b in benchmarks:
    plt.figure(figsize=(height, width))

    dfs_b = dfs[b]

    for c in classes:
        for i in ['mops_total','mops_thread','time_s']:
            plt.subplot(int('33' + str(counter) ))
            sriov_plt = plt.plot(dfs_b['sriov'][c].loc[:,'nproc'], dfs_b['sriov'][c].loc[:,i], '-o', linewidth=LINEWIDTH)
            ovs_plt = plt.plot(dfs_b['ovs'][c].loc[:,'nproc'], dfs_b['ovs'][c].loc[:,i], '-o', linewidth=LINEWIDTH)
            plt.legend(['sriov','ovs'])
            plt.xlabel('nproc')
            plt.ylabel(i)
            plt.title(b + '-' + c + ' ' + i)
            counter = counter + 1

    plt.suptitle('Result: ' + b)
plt.tight_layout()
plt.show()