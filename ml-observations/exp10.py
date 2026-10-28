"""
Experiment 10: Handwritten Digit Recognition (ANN)
Q10: Use scikit-learn's MLPClassifier (Artificial Neural Network)
on the sklearn digits dataset (8x8 handwritten digits, 0-9).
"""

import numpy as np
import matplotlib.pyplot as plt
from sklearn.neural_network import MLPClassifier
from sklearn.datasets import load_digits
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# Load the built-in digits dataset (1797 samples, 8x8 pixels)
digits = load_digits()
X = digits.data          # 64 features (flattened 8x8 image)
y = digits.target        # label 0-9

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=0
)

# Build ANN: hidden layers (64, 32)
model = MLPClassifier(
    hidden_layer_sizes=(64, 32),
    max_iter=300,
    random_state=0,
    activation='relu',
)
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
print("Accuracy:", accuracy_score(y_test, y_pred))
print("\nConfusion Matrix:")
print(confusion_matrix(y_test, y_pred))
print("\nClassification Report:")
print(classification_report(y_test, y_pred))

# Show a few test samples with predictions
fig, axes = plt.subplots(2, 5, figsize=(10, 4))
for i, ax in enumerate(axes.flat):
    ax.imshow(X_test[i].reshape(8, 8), cmap='gray')
    ax.set_title(f"P:{y_test[i]} G:{y_pred[i]}")
    ax.axis('off')
plt.suptitle("ANN: Actual vs Predicted")
plt.show()
