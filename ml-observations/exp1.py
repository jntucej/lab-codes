"""
Experiment 1: Descriptive Statistics
Q1: Mean, mode, median, variance, standard deviation, quartiles, IQR.
Uses statistics, math, numpy and scipy (study of basic libraries).
"""

import statistics
import math
import numpy as np
from scipy import stats

data = [10, 20, 30, 40, 50, 10, 10, 60]

# --- statistics module ---
mean = statistics.mean(data)
mode = statistics.mode(data)
median = statistics.median(data)
variance = statistics.variance(data)          # sample variance
std_dev = statistics.stdev(data)              # sample std dev

# --- numpy for quartiles ---
q1 = np.percentile(data, 25)
q2 = np.percentile(data, 50)
q3 = np.percentile(data, 75)
iqr = q3 - q1

# --- math / scipy cross-checks ---
p = len(data) - 1
var_pop = sum((x - mean) ** 2 for x in data) / p
chi2 = stats.chisquare([1, 1])               # demo scipy usage

print(f"Mean:               {mean}")
print(f"Mode:               {mode}")
print(f"Median:             {median}")
print(f"Variance (sample):  {variance}")
print(f"Std Dev (sample):   {std_dev}")
print(f"Quartile Q1:        {q1}")
print(f"Quartile Q2 (med):  {q2}")
print(f"Quartile Q3:        {q3}")
print(f"IQR (Q3-Q1):        {iqr}")
print(f"Variance (pop, math): {var_pop:.4f}")
print(f"Scipy chisquare demo: {chi2.statistic:.4f}")
