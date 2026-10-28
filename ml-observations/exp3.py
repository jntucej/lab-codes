"""
Experiment 3: Decision Tree Classifier on Iris dataset.
"""

import pandas as pd
import matplotlib.pyplot as plt
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from sklearn import tree

# Load data
data = pd.read_csv('datasets/iris.csv')
data = data.drop(columns=['Id'], errors='ignore')

X = data.iloc[:, :-1]
y = data.iloc[:, -1]

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=0
)

# Train
model = DecisionTreeClassifier(random_state=0)
model.fit(X_train, y_train)

# Predict + accuracy
y_pred = model.predict(X_test)
acc = accuracy_score(y_test, y_pred)
print("Accuracy:", acc)

# Visualize tree
plt.figure(figsize=(12, 8))
tree.plot_tree(model,
               feature_names=X.columns,
               class_names=model.classes_,
               filled=True)
plt.show()

# Predict on a new sample
new_sample = [[5.1, 3.5, 1.4, 0.2]]
print("Prediction:", model.predict(new_sample))
