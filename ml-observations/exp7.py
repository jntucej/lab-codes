"""
Experiment 7: Multiple Linear Regression for House Price prediction
(PDF Experiment 07 — Bengaluru_House_Data)

Predicts price using size (BHK), total_sqft, bath, balcony.
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, r2_score, mean_absolute_error

# Load data
df = pd.read_csv('datasets/house_prices_bengaluru.csv')
df = df.dropna(subset=['total_sqft', 'bath', 'price'])
df['total_sqft'] = pd.to_numeric(
    df['total_sqft'].astype(str).str.replace(r'[^0-9.]', '', regex=True),
    errors='coerce'
).fillna(0)

# Features: BHK (size like "2 BHK" -> 2), total_sqft, bath, balcony
df['bhk'] = df['size'].astype(str).str.extract(r'(\d+)')[0].astype(int)
X = df[['bhk', 'total_sqft', 'bath', 'balcony']]
y = df['price']

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=0
)

model = LinearRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)

print('R2 Score:', r2_score(y_test, y_pred))
print('MAE:', mean_absolute_error(y_test, y_pred))
print('MSE:', mean_squared_error(y_test, y_pred))

plt.scatter(y_test, y_pred, alpha=0.5)
plt.plot([y_test.min(), y_test.max()], [y_test.min(), y_test.max()], color='red')
plt.xlabel('Actual Price')
plt.ylabel('Predicted Price')
plt.title('Multiple Linear Regression: Actual vs Predicted House Price')
plt.show()
