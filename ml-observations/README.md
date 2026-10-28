# ML Observations

Machine Learning lab programs (Python + scikit-learn).
All datasets live in `datasets/` — no download needed.

## Experiments

| File | Algorithm | Dataset | PDF Exp |
|---|---|---|---|
| exp1.py | Descriptive Statistics | hardcoded | 01 |
| exp2.py | Simple Linear Regression | salary_dataset.csv | 02 |
| exp3.py | Decision Tree | iris.csv | 03 |
| exp4.py | Gaussian Naive Bayes | iris.csv (as "titanic") | 05 |
| exp5.py | K-Nearest Neighbours | iris.csv | 06 |
| exp6.py | Support Vector Machine | iris.csv | 07 |
| exp7.py | Multiple Linear Regression | house_prices_bengaluru.csv | 08 |
| exp8.py | Cross-Validation (KFold/LOO) | iris.csv | 09 |
| exp9.py | K-Means Clustering | iris.csv | 10 |

## Datasets

| File | Used by |
|---|---|
| `salary_dataset.csv` | exp2 |
| `iris.csv` | exp3, exp4, exp5, exp6, exp8, exp9 |
| `iris_updated.csv` | backup (no species col) |
| `house_prices_bengaluru.csv` | exp7 |
| `house_price_prediction.csv` | reference |
| `house_price_data.csv` | reference |

## Setup (one line)

```bash
pip install numpy pandas scikit-learn scipy matplotlib
```

## Run

```bash
python exp2.py
# or: open in VS Code and Run (F5)
```

## Quick runbook (lab machines)

```bash
# 1. Get the code
git clone https://github.com/jntucej/ml-observations.git
cd ml-observations

# 2. Install dependencies
pip install -r requirements.txt

# 3. Run a program
python exp3.py
```

## VS Code setup (Ubuntu lab machines)

One-click install + open folder:
```bash
sudo bash <(curl -fsSL https://raw.githubusercontent.com/jntucej/lab-codes/main/agent-setup/vscode-install.sh)
bash <(curl -fsSL https://raw.githubusercontent.com/jntucej/lab-codes/main/agent-setup/create-ml-dir.sh) ~/ml-observations
```
