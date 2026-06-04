
* 1. Convert ".." to missing
foreach var of varlist _all {
    capture confirm string variable `var'
    if !_rc {
        replace `var' = "" if `var' == ".."
    }
}

* 2. Destring numeric variables
destring Stockstradedtotalvaluecurr, replace ignore("")
destring Adjustednetnationalincomeper, replace ignore("")
destring Taxesonincomeprofitsandcap, replace ignore("")
destring Listeddomesticcompaniestotal, replace ignore("")
destring MobilecellularsubscriptionsI, replace ignore("")
destring Employmenttopopulationratio, replace ignore("")


* 3. Rename variables (make them readable)
rename CountryName country
rename CountryCode country_code
rename Time year

rename Stockstradedtotalvaluecurr stock_value
rename Adjustednetnationalincomeper adj_income
rename Taxesonincomeprofitsandcap taxes_income
rename Listeddomesticcompaniestotal listed_companies
rename MobilecellularsubscriptionsI mobile_subs
rename Employmenttopopulationratio employment_ratio


* 4. Drop unnecessary variable
drop TimeCode

* 5. Order variables neatly
order country country_code year

* 6. Sort data
sort country year

* 7. Optional: Handle duplicates
duplicates drop country year, force

* 8. Manually setting values
replace taxes_income = 0 if country == "Oman"
replace taxes_income = 0 if country == "United Arab Emirates"

* 9. Interpolation for smooth variables
foreach var in employment_ratio mobile_subs adj_income {
    by country: ipolate `var' year, gen(temp)
    replace `var' = temp if missing(`var')
    drop temp
}

* 10. Filling edge values
foreach var in employment_ratio mobile_subs adj_income {
    by country: replace `var' = `var'[_n-1] if missing(`var')
    by country: replace `var' = `var'[_n+1] if missing(`var')
}

* 11. Regression imputation
reg stock_value adj_income employment_ratio mobile_subs
predict stock_hat
replace stock_value = stock_hat if missing(stock_value)
drop stock_hat

reg taxes_income adj_income employment_ratio
predict tax_hat
replace taxes_income = tax_hat if missing(taxes_income)
drop tax_hat

* 12. Median Imputation
bysort country: egen med_listed = median(listed_companies)
replace listed_companies = med_listed if missing(listed_companies)
drop med_listed

* 13. 