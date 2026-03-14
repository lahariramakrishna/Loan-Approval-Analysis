# 🏦 Loan Approval Analysis — End-to-End Data Analytics Project

> **Tools:** Python (Pandas, NumPy, Matplotlib) · MySQL · Power BI · Jupyter Notebook  
> **Dataset:** 614 loan applications · 13 features · Real-world banking data

---

## 📌 Project Overview

Performed a full-cycle data analytics project on a banking loan dataset — from raw data ingestion and cleaning to SQL-based business analysis and an interactive Power BI dashboard.

The goal was to uncover **what drives loan approval decisions**, identify **high-risk vs low-risk applicants**, and provide actionable insights relevant to the home financing industry.

> 💡 This project is directly relevant to the mortgage and home loan domain — analyzing the same kind of data that financial institutions use to make real lending decisions.

---

## 📂 Dataset Description

| Feature | Details |
|---|---|
| Records | 614 loan applications |
| Columns | 13 (demographics, income, loan details, credit history) |
| Target Variable | Loan_Status (Approved / Rejected) |
| Key Metrics | Approval Rate, Avg Loan Amount, Credit History Impact |

**Key columns:** `Gender`, `Married`, `Education`, `ApplicantIncome`, `CoapplicantIncome`, `LoanAmount`, `Credit_History`, `Property_Area`, `Loan_Status`

---

## 🔄 Project Workflow

### 1. 🐍 Data Cleaning & Feature Engineering (Python)

- Loaded 614 records using **Pandas**
- Handled missing values across 7 columns:
  - Categorical columns (Gender, Married, Dependents, Self_Employed, Credit_History) → filled with **mode**
  - Numerical column (LoanAmount) → filled with **median**
- Engineered 3 new features:
  - **`Total_Income`** — combined ApplicantIncome + CoapplicantIncome for household-level analysis
  - **`Income_Group`** — segmented applicants into Low / Medium / High / Very High using `pd.cut`
  - **`Loan_Approved`** — converted Loan_Status (Y/N) to binary (1/0) for numerical analysis
- Loaded cleaned dataset into **MySQL** via SQLAlchemy
- Exported clean CSV for Power BI dashboard

### 2. 🗄️ SQL Business Analysis (MySQL)

Wrote 10 business-focused queries covering approval analysis, segmentation, and risk assessment:

| # | Business Question | Technique Used |
|---|---|---|
| 1 | Overall loan approval rate | Subquery + percentage calculation |
| 2 | Approval rate by gender | GROUP BY + aggregation |
| 3 | Credit history impact on approval | GROUP BY + conditional aggregation |
| 4 | Approval rate by property area | GROUP BY + ORDER BY |
| 5 | Loan amount vs education level | Multi-metric aggregation |
| 6 | High vs low value loan approval | CASE + Subquery |
| 7 | Approval by income segment | CTE + CASE segmentation |
| 8 | Self-employed vs salaried analysis | GROUP BY + AVG |
| 9 | Marital status impact on approval | Multi-metric aggregation |
| 10 | Top loan amounts by property area | CTE + Window Function (RANK) |

### 3. 📊 Power BI Dashboard

![Loan Approval Analysis Dashboard](dashboard.png)

Built an interactive dashboard with:
- 4 KPI cards: Total Applicants, Approval Rate, Avg Loan Amount, Credit History Impact
- Stacked bar chart: Approved vs Rejected by Credit History
- Donut chart: Overall approval split (68.73% vs 31.27%)
- Bar charts: Approval by Property Area, Education, Income Group, Gender, Marital Status
- Consistent blue theme with white labels for professional presentation

---

## 📈 Key Insights

- **Credit history is the #1 approval factor** — applicants with good credit get approved at 79.05% vs only 7.87% for bad credit — a 10x difference
- **68.73% overall approval rate** — 422 out of 614 applications approved
- **Semiurban applicants** have the highest approval rate at 76.82%, followed by Urban (65.84%) and Rural (61.45%)
- **Graduates** request higher loans (avg ₹153K vs ₹119K) and get approved more (70.83% vs 61.19%)
- **Married applicants** have significantly higher approval rate (71.82%) vs unmarried (62.91%)
- **Below average loan amounts** get approved more easily (70.72%) than above average requests (64.93%)
- **Self-employed applicants** earn more (avg ₹8,882 vs ₹6,738) but have nearly identical approval rates to salaried applicants
- **Medium income group** surprisingly has the highest approval rate (71.21%) — income alone doesn't determine approval

---

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| Python + Pandas | Data loading, cleaning, feature engineering |
| NumPy | Numerical operations |
| Matplotlib | EDA visualizations (4 charts) |
| MySQL | Database storage and SQL analysis |
| SQLAlchemy | Python-to-MySQL connection |
| Power BI | Interactive dashboard and visualization |
| Jupyter Notebook | Analysis and documentation |
| GitHub | Version control |

---
