*Calculating Log Values for stock_value and adjusted income
replace stock_value = abs(stock_value)
gen log_stock= log(stock_value)
gen log_income = log(adj_income)

*Regressing assuming homoscedascity
reg log_stock log_income employment_ratio mobile_subs taxes_income listed_companies

*Checking for heteroscedascity
estat hettest

*Regressing with heteroscedascity
reg log_stock log_income employment_ratio mobile_subs taxes_income listed_companies,robust

*Calculating Variance Inflation Factor
estat vif

*Calculating residuals
predict res,residuals

*Plotting Residuals
histogram res, normal title("Histogram of Residuals")



