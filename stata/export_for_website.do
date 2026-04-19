* ==================================================================
* export_for_website.do
*
* Regenerates the CSVs consumed by the profit-shifting-explorer
* (docs/country_data.csv and docs/industry_data.csv).
*
* Source .dta files live OUTSIDE the git repo (in the source folder).
* This script reads them by absolute path and writes derived CSVs
* into docs/ within the project folder.
*
* Author: Fotis Delis
* ==================================================================

version 17
clear all
set more off

* --- Paths ----------------------------------------------------------
local src "C:/Users/user/Desktop/profit shifting data and cv for website"
local out "docs"
cap mkdir "`out'"

* --- Table 11: country-level ---------------------------------------
use "`src'/Table 11_data.dta", clear
keep year guocountry lowest_tax_country MNE_profit_shifting
drop if missing(year, guocountry, lowest_tax_country, MNE_profit_shifting)

* Strip incidental whitespace (common after Stata imports)
replace guocountry         = strtrim(guocountry)
replace lowest_tax_country = strtrim(lowest_tax_country)

* Cast year to int and round the estimate to 3 decimal places
replace year = int(year)
replace MNE_profit_shifting = round(MNE_profit_shifting, 0.001)

export delimited using "`out'/country_data.csv", replace

* --- Table 8: industry-level ---------------------------------------
use "`src'/Table 8_data.dta", clear
keep year Industry Nacerev MNE_profit_shifting
drop if missing(year, Industry, Nacerev, MNE_profit_shifting)

replace Industry = strtrim(Industry)
* Nacerev is numeric (NACE Rev.2 sub-class code) — keep it numeric

replace year = int(year)
replace MNE_profit_shifting = round(MNE_profit_shifting, 0.001)

export delimited using "`out'/industry_data.csv", replace

di as result "Done. CSVs written to `out'/"
