"""
Experiment 8: Model Validation — K-Fold, Shuffled K-Fold,
Repeated K-Fold, and Leave-One-Out Cross-Validation
(PDF Experiment 08 — Logistic Regression on Iris)

Uses scikit-learn cross-validation scorers to compare
each strategy on the Iris dataset.
"""

import numpy as np
import pandas as pd
from sklearn.model_selection import (
    KFold, StratifiedKFold, ShuffleSplit,
    RepeatedKFold, LeaveOneOut, cross_validate,
    cross_val_score
)
from sklearn.linear_model import LogisticRegression

data = pd.read_csv('datasets/iris.csv')
data = data.drop(columns=['Id'], errors='ignore')
X = data.iloc[:, 1:-1]
y = data.iloc[:, -1]

model = LogisticRegression(max_iter=200)

# 1. K-Fold
print("K-Fold")
kf = KFold(n_splits=5)
scores_kf = cross_val_score(model, X, y, cv=kf, scoring='accuracy')
print("Average Accuracy:", np.mean(scores_kf))

# 2. Shuffled K-Fold
print("\nShuffled K-Fold")
ss = ShuffleSplit(n_splits=5, train_size=0.8, random_state=0)
scores_shuf = cross_val_score(model, X, y, cv=ss, scoring='accuracy')
print("Average Accuracy:", np.mean(scores_shuf))

# 3. Repeated K-Fold
print("\nRepeated K-Fold")
rkf = RepeatedKFold(n_splits=5, n_repeats=3)
scores_rep = cross_val_score(model, X, y, cv=rkf, scoring='accuracy')
print("Average Accuracy:", np.mean(scores_rep))

# 4. Leave-One-Out
print("\nLeave-One-Out")
loo = LeaveOneOut()
scores_loo = cross_val_score(model, X, y, cv=loo, scoring='accuracy')
print("Average Accuracy:", np.mean(scores_loo))
