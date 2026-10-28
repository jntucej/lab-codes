"""
Experiment 4: Gaussian Naive Bayes
(PDF Experiment 05 — Naive Bayes classifier, Iris dataset)

Trains on the numeric petal/sepal features, predicts Species.
"""

import pandas as pd
from sklearn.naive_bayes import GaussianNB
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

# Load data
df = pd.read_csv('datasets/iris.csv')
df = df.drop(columns=['Id'], errors='ignore')

# Features: numeric sepal/petal columns; target: Species
X = df.drop(columns=['Species'])
y = df['Species']

# One sample prediction (PDF's "New Input")
new_input = pd.DataFrame(
    {'SepalLengthCm': [5.1], 'SepalWidthCm': [3.5],
     'PetalLengthCm': [1.4], 'PetalWidthCm': [0.2]}
)

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=0
)

# Model
model = GaussianNB()
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)

print("Prediction for new sample:", model.predict(new_input).tolist())
