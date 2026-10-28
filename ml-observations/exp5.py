"""
Experiment 5: K-Nearest Neighbours on Iris dataset.
(PDF labels this as Experiment 06.)
"""

import numpy as np
import pandas as pd
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

# Load data
df = pd.read_csv('datasets/iris.csv')
df = df.drop(columns=['Id'], errors='ignore')

X = df.drop(columns=['species'])
y = df['species']

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=6
)

# Model
model = KNeighborsClassifier()
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
print("Accuracy:", accuracy_score(y_test, y_pred))

# Predict on a new sample
new_input = np.array([[5.1, 3.5, 1.4, 0.2]])
print("Prediction:", model.predict(new_input))
