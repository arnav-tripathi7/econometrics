Determinants of Stock Market Development

A cross-country econometric analysis examining the key economic and financial factors that influence stock market activity using World Bank data and Ordinary Least Squares (OLS) regression.  ￼

⸻

Overview

Stock markets play a crucial role in economic development by facilitating capital formation, improving resource allocation, and providing investment opportunities. This project investigates the determinants of stock market development by analyzing how various economic, financial, and technological factors affect the total value of stocks traded across multiple countries.

The study employs econometric techniques to identify significant drivers of stock market activity and provides policy recommendations for enhancing financial market participation and development.  ￼

⸻

Research Objective

The primary objective of this study is to examine the relationship between stock market activity and several macroeconomic and financial indicators across different countries.

Research Question

Which economic and financial factors significantly influence the total value of stocks traded in a country?

Dependent Variable

Stock Market Activity (stock_value)

* Total value of stocks traded on domestic exchanges
* Measured in current US dollars
* Represents market liquidity and trading activity
* Standardized for cross-country comparison  ￼

⸻

Team Members

* Aneesh Nitin Bhate
* Aashish Pendharkar
* Arnav Jain
* Aryan Tripathi
* Arnav Tripathi
* Atharva Agrawal
* Sanjay Saini

Course: HS163 – Basic Econometrics
Academic Year: 2025–2026
Institution: IIT Guwahati  ￼

⸻

Dataset

Data Source

World Bank – World Development Indicators (WDI)

The dataset was obtained from the World Bank DataBank, one of the most comprehensive global repositories of economic and development statistics.  ￼

Countries Included

The study analyzes data from 24 countries:

* Argentina
* Australia
* Austria
* Canada
* China
* Egypt
* France
* Germany
* India
* Italy
* Japan
* Malaysia
* Mexico
* New Zealand
* Norway
* Oman
* Russia
* Saudi Arabia
* Singapore
* South Africa
* Switzerland
* United Arab Emirates
* United Kingdom
* United States  ￼

⸻

Variables Used

Dependent Variable

Variable	Description
stock_value	Total value of stocks traded (Current US$)

Independent Variables

Variable	Description
adj_income	Adjusted net national income per capita
taxes_income	Taxes on income, profits, and capital gains (%)
listed_companies	Number of domestically listed companies
mobile_subs	Cellular subscriptions
employment_ratio	Employment-to-population ratio (%)

Variable Rationale

Adjusted Income (adj_income)

Represents sustainable income levels after accounting for depreciation and depletion of natural resources. Higher income levels are expected to increase investment capacity and financial market participation.

Taxes on Income (taxes_income)

Captures government taxation on income, profits, and capital gains. Tax policies can influence investment decisions and market participation.

Listed Companies (listed_companies)

Measures market depth and development. More listed firms generally indicate a more mature financial market with greater investment opportunities.

Mobile Subscriptions (mobile_subs)

Acts as a proxy for technological access and digital connectivity, facilitating access to financial information and trading platforms.

Employment Ratio (employment_ratio)

Represents labor market strength and income stability, potentially affecting investment behavior.  ￼

⸻

Methodology

Econometric Model

The study uses Ordinary Least Squares (OLS) Regression to estimate the relationship between stock market activity and the selected explanatory variables.

Model Specification

\log(stock\_value) =
\beta_0 +
\beta_1 \log(adj\_income) +
\beta_2 employment\_ratio +
\beta_3 mobile\_subs +
\beta_4 taxes\_income +
\beta_5 listed\_companies +
\epsilon

Why OLS?

OLS was chosen because:

* Assumes approximately linear relationships
* Produces interpretable coefficient estimates
* Supports multiple explanatory variables
* Enables statistical significance testing
* Suitable for large cross-country datasets
* Widely used in economics and finance research  ￼

⸻

Data Preprocessing

1. Data Cleaning

The following preprocessing steps were performed:

Column Standardization

* Renamed variables to more readable names
* Converted string variables to numeric format
* Removed redundant columns

Removal of Unnecessary Variables

* Dropped TimeCode
* Retained year variable

Sorting

Data sorted by:

* Country
* Year

Duplicate Handling

Duplicate observations were removed where necessary.  ￼

⸻

2. Missing Value Treatment

Different imputation techniques were applied depending on the variable characteristics.

Manual Imputation

Used when missing values represented actual policy conditions.

Example:

replace taxes_income = 0 if country == "Oman"
replace taxes_income = 0 if country == "United Arab Emirates"

Interpolation

Applied to:

* Employment ratio
* Mobile subscriptions
* Adjusted income

Used for smooth time-series estimation.

Regression Imputation

Applied to:

* Taxes on income

Predicted using:

* Adjusted income
* Employment ratio

Median Imputation

Applied to:

* Listed companies

Chosen because it is robust to outliers.  ￼

⸻

3. Log Transformation

The following variables exhibited large magnitudes and skewed distributions:

* stock_value
* adj_income

Logarithmic transformation was applied:

gen log_stock = log(stock_value)
gen log_income = log(adj_income)

Benefits:

* Reduces skewness
* Mitigates influence of extreme observations
* Improves normality
* Allows elasticity interpretation of coefficients  ￼

⸻

Statistical Diagnostics

Heteroskedasticity Test

Breusch–Pagan/Cook–Weisberg Test

Results:

Statistic	Value
Chi-square	4.38
p-value	0.0364

Interpretation

Since:

p < 0.05

The null hypothesis of homoscedasticity was rejected.

Conclusion: Heteroskedasticity exists in the model, requiring robust standard errors.  ￼

⸻

Robust Regression

To address heteroskedasticity:

reg log_stock log_income employment_ratio mobile_subs taxes_income listed_companies, robust

Robust standard errors were used for all final statistical inference.  ￼

⸻

Multicollinearity Check

Variance Inflation Factor (VIF) was computed.

Variable	VIF
Listed Companies	2.43
Mobile Subs	2.33
Log Income	1.43
Taxes Income	1.35
Employment Ratio	1.33

Mean VIF = 1.77

Interpretation

* VIF < 5 for all variables
* No serious multicollinearity detected
* Coefficient estimates are considered stable and reliable  ￼

⸻

Residual Analysis

Residuals were computed and plotted using a histogram.

Findings

* Residuals are approximately centered around zero
* Distribution resembles a bell curve
* Minor deviations from normality exist
* No severe violations of OLS assumptions observed

Conclusion

The model satisfies normality assumptions reasonably well and can be considered statistically reliable.  ￼

⸻

Results

Model Performance

Metric	Value
Observations	600
R²	0.451
Root MSE	1.782

Interpretation

The model explains approximately 45.1% of the variation in stock market activity across countries and years. This indicates moderate explanatory power.  ￼

⸻

Key Findings

1. Income Levels

Coefficient: +0.932

Statistical Significance: Highly significant

Interpretation

A 1% increase in adjusted income per capita is associated with approximately a 0.93% increase in stock value traded.

Implication:

* Higher income encourages investment
* Income is the strongest predictor of stock market activity

⸻

2. Employment Ratio

Coefficient: Negative

Statistical Significance: Significant

Interpretation

Higher employment levels are associated with lower stock market activity after controlling for other factors.

Possible explanations:

* Employment concentrated in sectors with low market participation
* Preference for consumption or stable income rather than investment

⸻

3. Mobile Subscriptions

Coefficient: Positive

Statistical Significance: Significant

Interpretation

Greater technological access increases stock market participation.

Benefits include:

* Better access to information
* Easier online trading
* Improved financial inclusion

⸻

4. Taxes on Income

Coefficient: Positive

Statistical Significance: Not significant

Interpretation

No strong evidence that taxation significantly affects stock market activity within the scope of this model.

⸻

5. Listed Companies

Coefficient: Positive

Statistical Significance: Highly significant

Interpretation

An increase in listed firms significantly increases stock market activity.

Benefits:

* Greater market depth
* More investment opportunities
* Improved liquidity

￼

⸻

Policy Recommendations

Improve Household Income

* Encourage long-term investments through tax incentives
* Introduce tax-advantaged investment accounts
* Promote skill development and formal employment

Increase Financial Literacy

* Introduce financial education programs
* Include investment concepts in school curricula
* Conduct public awareness campaigns

Expand Digital Access

* Improve internet infrastructure
* Increase smartphone penetration
* Support fintech innovation

Strengthen Capital Markets

* Simplify listing requirements
* Reduce compliance costs
* Promote SME stock exchanges

Tax Policy Reform

* Maintain predictable tax structures
* Simplify capital gains taxation
* Avoid abrupt regulatory changes

Connect Employment to Investing

* Encourage retirement and investment plans linked to employment
* Promote employer-supported investment schemes

￼

⸻

Limitations

The study acknowledges several limitations:

1. Limited set of explanatory variables
2. Relatively short observation period
3. Use of pooled OLS instead of panel-data methods
4. Potential endogeneity issues
5. Lack of dynamic modeling and lagged effects

￼

⸻

Future Work

Potential extensions include:

* Incorporating inflation and interest rates
* Including financial literacy indicators
* Using Fixed Effects or Random Effects models
* Applying Instrumental Variable (IV) techniques
* Developing dynamic panel models
* Expanding country and time coverage

￼

⸻

Tools Used

Software

* Stata

Techniques

* Data Cleaning
* Interpolation
* Regression Imputation
* Median Imputation
* Log Transformation
* OLS Regression
* Robust Standard Errors
* Heteroskedasticity Testing
* Variance Inflation Factor Analysis
* Residual Diagnostics

￼

⸻

Reference

World Bank. World Development Indicators (WDI). Available at:

https://databank.worldbank.org/source/world-development-indicators

￼

⸻

License

This project was developed as part of the coursework for HS163: Basic Econometrics at IIT Guwahati for academic and educational purposes.  ￼
