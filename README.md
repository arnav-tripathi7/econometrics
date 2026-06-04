# 📈 Determinants of Stock Market Development

An econometric analysis of the factors influencing stock market activity across 24 countries using World Bank data and Ordinary Least Squares (OLS) regression.

![Econometrics](https://img.shields.io/badge/Econometrics-OLS-blue)
![Dataset](https://img.shields.io/badge/Data-World%20Bank-green)
![Software](https://img.shields.io/badge/Software-Stata-red)
![Countries](https://img.shields.io/badge/Countries-24-orange)

---

## 📖 Overview

Stock markets play a crucial role in economic development by facilitating capital allocation, improving liquidity, and enabling wealth creation. Understanding the factors that drive stock market participation and activity is essential for policymakers, investors, and researchers.

This project investigates the determinants of stock market development using cross-country panel data from the **World Bank World Development Indicators (WDI)** database. The analysis focuses on how economic prosperity, taxation, employment, technological penetration, and market depth influence the **total value of stocks traded**.

The study employs **Ordinary Least Squares (OLS) Regression**, followed by diagnostic testing for heteroskedasticity, multicollinearity, and residual normality to ensure robust and reliable results.

---

## 🎯 Research Objective

The primary objective of this study is to identify the economic and financial variables that significantly affect stock market activity.

### Research Question

> What are the key determinants of stock market development across countries?

### Hypothesis

Economic prosperity, technological access, and market depth positively influence stock market activity, while taxation and labor market conditions may have varying effects.

---

## 🌍 Dataset

### Source

- **World Bank DataBank**
- **World Development Indicators (WDI)**

Link:
https://databank.worldbank.org/source/world-development-indicators

### Countries Included

| Region | Countries |
|----------|-----------|
| Asia | India, China, Japan, Malaysia, Singapore, Saudi Arabia, Oman, UAE |
| Europe | Austria, Germany, France, Italy, Norway, Switzerland, United Kingdom, Russia |
| Americas | United States, Canada, Mexico, Argentina |
| Africa | Egypt, South Africa |
| Oceania | Australia, New Zealand |

### Total Observations

- **600 observations**
- Multiple years across 24 countries

---

## 📊 Variables Used

### Dependent Variable

| Variable | Description |
|-----------|-------------|
| `stock_value` | Total value of stocks traded (Current US$) |

---

### Independent Variables

| Variable | Description |
|-----------|-------------|
| `adj_income` | Adjusted Net National Income per Capita |
| `taxes_income` | Taxes on Income, Profits and Capital Gains (%) |
| `listed_companies` | Number of Domestically Listed Companies |
| `mobile_subs` | Mobile Cellular Subscriptions |
| `employment_ratio` | Employment-to-Population Ratio |

---

## 🛠 Methodology

### 1. Data Cleaning

The raw dataset underwent extensive preprocessing before analysis.

#### Cleaning Steps

- Converted missing placeholders (`".."`) into actual missing values
- Converted string variables to numeric format
- Standardized variable names
- Removed redundant columns
- Sorted observations by country and year
- Removed duplicate observations

---

### 2. Missing Value Treatment

Different imputation methods were applied depending on the nature of the variable.

| Method | Variables |
|----------|-----------|
| Manual Imputation | Taxes for UAE and Oman |
| Interpolation | Employment Ratio, Mobile Subs, Income |
| Regression Imputation | Taxes Income |
| Median Imputation | Listed Companies |

---

### 3. Log Transformation

To reduce skewness and improve interpretability:

```stata
gen log_stock = log(stock_value)
gen log_income = log(adj_income)
```

Benefits:

- Reduces influence of outliers
- Improves normality
- Allows elasticity interpretation
- Stabilizes variance

---

## 📐 Econometric Model

The final model estimated was:

$begin:math:display$
\\log\(stock\\\_value\)
\=
\\beta\_0
\+
\\beta\_1 \\log\(adj\\\_income\)
\+
\\beta\_2 employment\\\_ratio
\+
\\beta\_3 mobile\\\_subs
\+
\\beta\_4 taxes\\\_income
\+
\\beta\_5 listed\\\_companies
\+
\\epsilon
$end:math:display$

### Why OLS?

- Simple and interpretable
- Suitable for continuous outcomes
- Supports multiple explanatory variables
- Allows statistical significance testing
- Widely used in economics and finance

---

## 🔍 Model Diagnostics

### Heteroskedasticity Test

Breusch–Pagan / Cook–Weisberg Test

| Statistic | Value |
|------------|--------|
| Chi-square | 4.38 |
| p-value | 0.0364 |

### Conclusion

Since:

```text
p-value < 0.05
```

The null hypothesis of homoscedasticity is rejected.

➡️ Heteroskedasticity exists.

Therefore, the model was re-estimated using **robust standard errors**.

---

### Multicollinearity Test

Variance Inflation Factor (VIF)

| Variable | VIF |
|-----------|------|
| Listed Companies | 2.43 |
| Mobile Subs | 2.33 |
| Log Income | 1.43 |
| Taxes Income | 1.35 |
| Employment Ratio | 1.33 |

**Mean VIF = 1.77**

### Conclusion

All VIF values are below 5.

✅ No serious multicollinearity detected.

---

### Residual Analysis

A histogram of residuals was generated to verify normality assumptions.

Observations:

- Residuals centered around zero
- Approximately bell-shaped distribution
- Mild skewness at tails
- No major violations of OLS assumptions

✅ Model assumptions reasonably satisfied.

---

## 📈 Results

### Model Performance

| Metric | Value |
|----------|---------|
| Observations | 600 |
| R² | 0.451 |
| Root MSE | 1.782 |

### Interpretation

The model explains approximately **45.1%** of the variation in stock market activity.

This indicates a moderate explanatory power while suggesting the presence of additional determinants not included in the model.

---

## 🔑 Key Findings

### 1. Income Level (`log_income`)

| Effect | Significance |
|----------|------------|
| Positive | Highly Significant |

Coefficient:

```text
0.932
```

Interpretation:

> A 1% increase in adjusted income per capita leads to approximately a 0.93% increase in stock value traded.

### Insight

Higher incomes increase savings capacity and participation in financial markets.

---

### 2. Employment Ratio

| Effect | Significance |
|----------|------------|
| Negative | Significant |

Interpretation:

Higher employment rates are associated with lower stock market activity after controlling for other factors.

Possible reasons:

- Employment concentrated in low-investment sectors
- Preference for stable income over financial investments

---

### 3. Mobile Subscriptions

| Effect | Significance |
|----------|------------|
| Positive | Significant |

Interpretation:

Greater digital connectivity improves:

- Access to market information
- Online trading participation
- Financial inclusion

---

### 4. Taxes on Income

| Effect | Significance |
|----------|------------|
| Positive | Not Significant |

Interpretation:

Taxation does not show a statistically significant impact on stock market activity within this model.

---

### 5. Listed Companies

| Effect | Significance |
|----------|------------|
| Positive | Highly Significant |

Interpretation:

An increase in listed firms leads to greater stock market activity through:

- Improved liquidity
- Greater investment opportunities
- Increased market depth

---

## 🏛 Policy Recommendations

### 💰 Improve Income Levels

- Tax incentives for long-term investments
- Investment-linked savings accounts
- Income growth programs

### 📚 Increase Financial Literacy

- School-level financial education
- Investor awareness campaigns
- Digital learning platforms

### 📱 Expand Digital Access

- Affordable internet connectivity
- Improved smartphone penetration
- Support fintech innovation

### 🏢 Deepen Capital Markets

- Simplify IPO procedures
- Encourage SME listings
- Reduce compliance burdens

### ⚖️ Stable Tax Policy

- Transparent taxation framework
- Predictable capital gains policies
- Reduced regulatory uncertainty

### 👨‍💼 Integrate Employment & Investing

- Employer-sponsored investment plans
- Retirement-linked market participation
- Automatic enrollment schemes

---

## 🚧 Limitations

The study has several limitations:

- Limited number of explanatory variables
- Possible omitted variable bias
- Relatively short time horizon
- Potential endogeneity issues
- Pooled OLS instead of panel data techniques

---

## 🔮 Future Improvements

Potential extensions include:

- Fixed Effects Models
- Random Effects Models
- Instrumental Variable Regression
- Dynamic Panel Models
- Inclusion of Inflation and Interest Rates
- Financial Literacy Indicators
- Institutional Quality Measures

---

## 💻 Software Used

- Stata
- World Bank DataBank
- Microsoft Excel

### Key Techniques

- Data Cleaning
- Interpolation
- Regression Imputation
- Median Imputation
- OLS Regression
- Robust Standard Errors
- VIF Analysis
- Heteroskedasticity Testing
- Residual Diagnostics

---

## 📂 Project Structure

```text
.
├── data/
│   ├── raw_data.csv
│   └── cleaned_data.csv
│
├── scripts/
│   ├── cleaning.do
│   ├── processing.do
│   └── regression.do
│
├── outputs/
│   ├── regression_results.csv
│   ├── residual_histogram.png
│   └── vif_results.csv
│
├── report/
│   └── Final_Report.pdf
│
└── README.md
```

---

## 📚 References

1. World Bank World Development Indicators (WDI)
   https://databank.worldbank.org/source/world-development-indicators

---

## 👥 Authors

- Aneesh Nitin Bhate
- Aashish Pendharkar
- Arnav Jain
- Aryan Tripathi
- Arnav Tripathi
- Atharva Agrawal
- Sanjay Saini

**Course:** HS163 – Basic Econometrics  
**Institution:** IIT Guwahati  
**Academic Year:** 2025–26

---

## 📄 License

This project was developed for academic and educational purposes as part of the HS163 Basic Econometrics coursework at IIT Guwahati.
