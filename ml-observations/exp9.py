"""
Experiment 9: K-Means Clustering on Iris dataset
(PDF Experiment 09 — sample training dataset stored as CSV)

Uses MinMaxScaler + KMeans with 3 clusters,
then plots clusters on PetalLength vs PetalWidth.
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler
from sklearn.cluster import KMeans

df = pd.read_csv('datasets/iris.csv')
scaler = MinMaxScaler()
X = scaler.fit_transform(
    df.drop(columns=['Id'], errors='ignore')
)

kmeans = KMeans(n_clusters=3, random_state=0)
kmeans.fit(X)
df['Cluster'] = kmeans.labels_

plt.figure(figsize=(8, 6))
plt.scatter(df['SepalLengthCm'], df['SepalWidthCm'], c=df['Cluster'], cmap='viridis')
plt.xlabel('Sepal Length')
plt.ylabel('Sepal Width')
plt.title('K-Means Clustering: Iris (3 clusters)')
plt.colorbar(label='Cluster')
plt.show()

print("Cluster sizes:", df['Cluster'].value_counts().to_dict())
