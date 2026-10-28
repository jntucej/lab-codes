"""
Experiment 3: Decision Tree — ID3 Algorithm
Q3: Demonstrate the ID3 algorithm (information gain via entropy).
Builds the tree on the classic 'Play Tennis' dataset and classifies
a new sample.
"""

import numpy as np
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn import tree

# Classic ID3 dataset (Play Tennis)
columns = ['Outlook', 'Temperature', 'Humidity', 'Wind', 'Play']
data = [
    ['Sunny', 85, 'High', 'No', 'No'],
    ['Sunny', 80, 'High', 'Yes', 'No'],
    ['Overcast', 83, 'High', 'Yes', 'Yes'],
    ['Rain', 70, 'High', 'Yes', 'Yes'],
    ['Rain', 68, 'Normal', 'No', 'Yes'],
    ['Rain', 65, 'Normal', 'No', 'No'],
    ['Overcast', 64, 'Normal', 'No', 'Yes'],
    ['Sunny', 71, 'High', 'No', 'No'],
    ['Sunny', 64, 'Normal', 'No', 'Yes'],
    ['Rain', 72, 'Normal', 'Yes', 'Yes'],
    ['Sunny', 71, 'High', 'No', 'No'],
    ['Overcast', 70, 'High', 'No', 'Yes'],
    ['Overcast', 72, 'Normal', 'No', 'Yes'],
    ['Sunny', 80, 'High', 'Yes', 'No'],
]
df = pd.DataFrame(data, columns=columns)
df = pd.get_dummies(df, columns=['Outlook', 'Temperature', 'Humidity', 'Wind'],
                    drop_first=False)

X = df.drop(columns=['Play'])
y = df['Play']

# ID3 = entropy criterion + gini not used; class_weight=None
model = DecisionTreeClassifier(criterion='entropy', random_state=0)
model.fit(X, y)

# Visualize tree
plt = __import__('matplotlib.pyplot', fromlist=['plot'])
plt.figure(figsize=(14, 8))
tree.plot_tree(model, feature_names=X.columns, filled=True, rounded=True)
plt.title("ID3 Decision Tree (entropy criterion)")
plt.show()

# Classify a new sample: Sunny, 68, Normal, No
new_sample = pd.DataFrame([[1, 0, 0, 1, 0, 1, 0, 0]],
                          columns=[c for c in X.columns if c in
                                   ['Outlook_Sunny', 'Outlook_Overcast', 'Outlook_Rain',
                                   'Temperature_high', 'Temperature_low', 'Humidity_Normal',
                                   'Humidity_High', 'Wind_No', 'Wind_Yes']])
# Build properly from the dummies
new_row = pd.DataFrame([['Sunny', 68, 'Normal', 'No']], columns=columns)
new_row = pd.get_dummies(new_row, columns=['Outlook', 'Temperature', 'Humidity', 'Wind'],
                         drop_first=False)
new_X = new_row.drop(columns=['Play'])
print("New sample prediction:", model.predict(new_X)[0])
print("Feature importances:", dict(zip(X.columns, model.feature_importances_.round(3))))
