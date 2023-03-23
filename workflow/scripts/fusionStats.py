#! /usr/bin/python


# ---------------------------

import os
import glob
import sys
import numpy as np
np.random.seed(42)
import pandas as pd
%matplotlib
import matplotlib.pyplot as plt
#import matplotlib as mpl
import seaborn as sns
sns.set_style('whitegrid')
import math

# ---------------------------

fmask = r'./K562*/stats.txt'
flist = glob.glob(fmask)

def read_data(flist, **kwargs):
    dfs = dict()
    for f in flist:
        nam = f.split('/')[1]
        df = pd.read_table(f, **kwargs)
        dfs[nam] = df
    return dfs #pd.concat(dfs, ignore_index=True)

dfdict = read_data(flist)



#for key, value in dfdict.items():
#    print(key)

coln = 2  # how many plots per row
rown = 3    #math.ceil(len(dfdict) / col_nums)  # how many rows of plots
#plt.figure(figsize=(10, 10))  # change the figure size as needed
fig, ax = plt.subplots(nrows=rown, ncols=coln)
for i, (k, v) in enumerate(dfdict.items(), 1):
    j = i +
    plt.subplot(rown, coln, i)
    plt.hist(v['Score'], bins= 'auto')
    plt.subplot(rown, coln, i+1)
    plt.hist(v['NumSplitReads'], bins= 'auto')

ax[0,0].hist(dfdict['K562-10ng-1plex-Rep2']['Score'])
ax[0,1].hist(dfdict['K562-10ng-1plex-Rep2']['NumSplitReads'])

ax[1,0].hist(dfdict['K562-100ng-1plex-Rep1']['Score'])
ax[1,2].hist(dfdict['K562-100ng-1plex-Rep1']['NumSplitReads'])
ax[0,0].hist(dfdict['K562-10ng-1plex-Rep2']['Score'])
ax[0,1].hist(dfdict['K562-10ng-1plex-Rep2']['NumSplitReads'])





coln = 2  # how many plots per row
rown = 3    #math.ceil(len(dfdict) / col_nums)  # how many rows of plots
plt.figure(figsize=(10, 10))  # change the figure size as needed
fig, ax = plt.subplots(nrows=rown, ncols=coln)
for i, (k, v) in enumerate(dfdict.items(), 1):
    for stat in v.columns:
        plt.subplot(rown, coln, i)
        plt.hist(v[stat], bins= 'auto')
        #plt.title(f'DataFrame: {k}')


    p = sns.scatterplot(data=v, x='cpc', y='rate_bid', hue='site_target', palette=cmap)
    p.legend_.remove()
    plt.title(f'DataFrame: {k}')




plt.hist(dfdict['K562-100ng-1plex-Rep1']['Score'], bins= 'auto', density=False)



