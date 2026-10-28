"""
Experiment 4: Gaussian Naive Bayes on Titanic dataset.
(PDF labels this as Experiment 05.)
"""

import pandas as pd
from sklearn.naive_bayes import GaussianNB
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

# Load data
df = pd.read_csv('datasets/titanic.csv')

# Drop columns that are not useful for the model
df = df.drop(columns=['Name', 'Ticket', 'Cabin', 'PassengerId'], errors='ignore')

# Handle missing values
df = df.fillna(df.median(numeric_only=True))

# Features and target
X = pd.get_dummies(df.iloc[:, :-1])
y = df.iloc[:, -1]

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=0
)

# Model
model = GaussianNB()
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
print("Accuracy:", accuracy_score(y_test, y_pred))
