"""
Experiment 1: Compute descriptive statistics
(mean, mode, median, variance, standard deviation, quartile range)
"""

import pandas as pd
from scipy import stats

data = [10, 10, 10, 12, 15, 18, 20, 25, 30, 35, 40, 45, 50, 55, 60]
series = pd.Series(data)

mean = series.mean()
mode = series.mode()[0]
median = series.median()
variance = series.var()
std_dev = series.std()
q1 = series.quantile(0.25)
q3 = series.quantile(0.75)
quartile_range = q3 - q1

print("Mean:", mean)
print("Mode:", mode)
print("Median:", median)
print("Variance:", variance)
print("Standard Deviation:", std_dev)
print("Quartile Range:", quartile_range)
