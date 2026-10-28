"""
Experiment 3: Decision Tree — ID3 Algorithm (Iris dataset)
Q3: Demonstrate the ID3 algorithm (entropy / information gain).
Builds the tree on the Iris dataset and classifies a new sample.
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from sklearn import tree

# Load data
data = pd.read_csv('datasets/iris.csv')
data = data.drop(columns=['Id'], errors='ignore')

X = data.drop(columns=['Species'])
y = data['Species']

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=0
)

# ID3 = entropy criterion
model = DecisionTreeClassifier(criterion='entropy', random_state=0)
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
print("Accuracy:", accuracy_score(y_test, y_pred))

# Feature importances (information gain ranking)
print("Feature importances (info gain):")
for name, imp in zip(X.columns, model.feature_importances_):
    print(f"  {name}: {imp:.4f}")

# Visualize tree
plt.figure(figsize=(16, 10))
tree.plot_tree(model,
               feature_names=X.columns,
               class_names=list(model.classes_),
               filled=True, rounded=True)
plt.title("ID3 Decision Tree (Iris, entropy criterion)")
plt.show()

# Classify a new sample: a virginica-like flower
new_sample = pd.DataFrame(
    [[6.3, 3.3, 6.0, 2.5]],
    columns=X.columns
)
print("New sample prediction:", model.predict(new_sample)[0])
