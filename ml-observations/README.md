# ML Observations

Python + scikit-learn lab programs, matched to the 10 lab questions.

## Experiments (Q1–Q10)

| File | Lab Question | Algorithm |
|---|---|---|
| exp1.py | Q1 | Descriptive statistics (mean, mode, median, variance, std, quartiles, IQR) — statistics/math/numpy/scipy |
| exp2.py | Q2 | Simple Linear Regression (Salary dataset) |
| exp3.py | Q3 | Decision Tree — ID3 algorithm (entropy, Play Tennis dataset) |
| exp4.py | Q5 | Naive Bayes (Gaussian NB, accuracy + new sample) |
| exp5.py | Q6 | K-Nearest Neighbours on Iris (accuracy) |
| exp6.py | Q7 | SVM (SVC) on Iris (accuracy) |
| exp7.py | Q4 | Multiple Linear Regression — House Price prediction |
| exp8.py | Q8 | K-Fold, Shuffled K-Fold, Repeated K-Fold, Leave-One-Out |
| exp9.py | Q9 | K-Means Clustering (CSV dataset) |
| exp10.py | Q10 | ANN (MLP) — handwritten digit recognition |

## Datasets

```
datasets/
  salary_dataset.csv          exp2
  iris.csv                    exp4, exp5, exp6
  house_prices_bengaluru.csv  exp7
  house_price_prediction.csv  reference
  house_price_data.csv        reference
  iris_updated.csv            backup
```

Q1, Q3, Q10 use hardcoded / sklearn built-in data — no CSV needed.

## Setup

```bash
pip install numpy pandas scikit-learn scipy matplotlib
```

## Run (Q order)

```bash
python exp1.py    # Q1
python exp2.py    # Q2
python exp3.py    # Q3 (ID3)
python exp4.py    # Q5 (Naive Bayes)
python exp5.py    # Q6 (KNN)
python exp6.py    # Q7 (SVM)
python exp7.py    # Q4 (Multi Linear Regression)
python exp8.py    # Q8 (Cross-validation)
python exp9.py    # Q9 (K-Means)
python exp10.py   # Q10 (ANN digits)
```

## Quick runbook (lab machines)

```bash
# 1. Get the code
git clone https://github.com/jntucej/lab-codes.git
cd lab-codes/ml-observations

# 2. Install dependencies
pip install -r requirements.txt

# 3. Run
python exp1.py
```

## VS Code setup (Ubuntu lab machines)

One-click install + open folder:
```bash
sudo bash <(curl -fsSL https://raw.githubusercontent.com/jntucej/lab-codes/main/agent-setup/vscode-install.sh)
bash <(curl -fsSL https://raw.githubusercontent.com/jntucej/lab-codes/main/agent-setup/create-ml-dir.sh) ~/ml-observations
```
