"""
Experiment 2: Simple Linear Regression on Salary data.
(PDF Experiment 02 — matches Salary_dataset.csv in datasets/)

Predicts Salary from YearsExperience.
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error

# Load data
data = pd.read_csv('datasets/salary_dataset.csv')
X = data.iloc[:, 1:2]      # YearsExperience
Y = data.iloc[:, -1]       # Salary

X_train, X_test, y_train, y_test = train_test_split(
    X, Y, test_size=0.2, random_state=0
)

model = LinearRegression()
model.fit(X_train, y_train)
y_predict = model.predict(X_test)

mae = mean_absolute_error(y_test, y_predict)
print('MAE:', mae)
print('Slope (per year):', model.coef_[0])

plt.scatter(X_train, y_train, color='blue', label='Training Data')
plt.scatter(X_test, y_test, color='orange', label='Test Data')
plt.plot(X_test, y_predict, color='green', label='Regression line')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.title('Linear Regression: Salary vs Years of Experience')
plt.legend()
plt.show()
