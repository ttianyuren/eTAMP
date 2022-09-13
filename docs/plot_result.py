import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_context('paper')
df = pd.read_csv('test_data.csv', header=0)

list_header = list(df)

list_etamp_mean = []
list_etamp_std = []
list_adaptive_mean = []
list_adaptive_std = []
list_etamp_success = []
list_adaptive_success = []

list_task = []

for i, c0 in enumerate(df):
    c_name = df.columns.values[i]
    c = df[c_name]
    task, method = c_name.split('_')

    if 'etamp' in c_name:
        list_etamp_mean.append(c.mean())
        list_etamp_std.append(c.std())
        list_etamp_success.append(len([i for i in c if i < 300]))

    elif 'adaptive' in c_name:
        list_adaptive_mean.append(c.mean())
        list_adaptive_std.append(c.std())
        list_adaptive_success.append(len([i for i in c if i < 300]))

    if task not in list_task:
        list_task.append(task)

# print(list_etamp_mean)
# print(list_adaptive_mean)

ind = np.arange(len(list_adaptive_mean))  # the x locations for the groups
width = 0.37  # the width of the bars

fontsize = 18

fig, ax = plt.subplots()
rects1 = ax.bar(ind - width / 2, list_etamp_mean, width, yerr=list_etamp_std,
                label='eTAMP')
rects2 = ax.bar(ind + width / 2, list_adaptive_mean, width, yerr=list_adaptive_std,
                label='Adaptive')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Time cost', fontsize=fontsize)
ax.set_xticks(ind)
ax.set_xticklabels(list_task, fontsize=fontsize)
ax.tick_params(axis='both', labelsize=fontsize)

ax.legend(loc='upper left', fontsize=fontsize)


print(list_etamp_mean)
print(list_adaptive_mean)

print(list_etamp_success)
print(list_adaptive_success)

plt.show()

