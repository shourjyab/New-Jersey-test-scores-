*************************
*************************
*************************
//year 2010

//ado file to shape the data
cap program drop ado1
program define ado1

keep A B C D E F N O P Q W X Y Z 
rename A county_code
rename B district_code
rename C school_code
rename D county_name
rename E dist_name
rename F school_name

rename N total_ppl3_10 
rename O total_pl3_10
rename P total_apl3_10
rename Q total_tsl3_10

rename W total_ppm3_10 
rename X total_pm3_10
rename Y total_apm3_10
rename Z total_tsm3_10

drop in 1/5 

destring district_code, replace

unique county_code 

tab county_code
destring county_code, replace ignore ("B" "CD" "DE" "FG" "GH" "I" "J" "N" "R")

destring school_code, replace 
keep if school_code==.

destring total_ppl3_10 total_pl3_10 total_apl3_10 total_tsl3_10 total_ppm3_10 total_pm3_10 total_apm3_10 total_tsm3_10, replace ignore("*")

drop school_code school_name 
drop if district_code==. 
drop if county_name=="CHARTER SCHOOLS"
end

//ado files for renaming for grade 5 
cap program drop ado2
program define ado2
rename total_ppl3_10 total_ppl5_10 
rename total_pl3_10 total_pl5_10
rename total_apl3_10 total_apl5_10
rename total_tsl3_10 total_tsl5_10

rename total_ppm3_10 total_ppm5_10
rename total_pm3_10 total_pm5_10
rename total_apm3_10 total_apm5_10
rename total_tsm3_10 total_tsm5_10

end

//ado files for renaming for grade 8 
cap program drop ado3
program define ado3
rename total_ppl3_10 total_ppl8_10 
rename total_pl3_10 total_pl8_10
rename total_apl3_10 total_apl8_10
rename total_tsl3_10 total_tsl8_10

rename total_ppm3_10 total_ppm8_10
rename total_pm3_10 total_pm8_10
rename total_apm3_10 total_apm8_10
rename total_tsm3_10 total_tsm8_10

end


//importing the data and saving the files
import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr3_2010.xls", sheet("Total and Instructional Groups")
save gr3_2010
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr5_2010.xls", sheet("Total and Instructional Groups")
save gr5_2010
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr8_2010.xls", sheet("Total and Instructional Groups")
save gr8_2010
clear

//using ado files to shape the files
use gr3_2010
ado1 
save, replace
clear 

use gr5_2010
ado1
ado2
save, replace
clear

use gr8_2010
ado1
ado3
destring county_code, replace
save, replace
clear

//merging the files for 2010

use gr3_2010
merge 1:1 district_code using gr5_2010
drop _merge
merge 1:1 district_code using gr8_2010
drop _merge
drop county_code county_name

save gr10_c
clear

*************************
*************************
*************************
//year 2011

//importing the data and saving the files
import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr3_2011.xls", sheet("Total and Instructional Groups")
save gr3_2011
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr5_2011.xls", sheet("Total and Instructional Groups")
save gr5_2011
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr8_2011.xls", sheet("Total and Instructional Groups")
save gr8_2011
clear

//using ado files to shape the files
use gr3_2011
ado1 
save, replace
clear 

use gr5_2011
ado1
ado2
save, replace
clear

use gr8_2011
ado1
ado3
destring county_code, replace
save, replace
clear

//merging the files for 2011

use gr3_2011
merge 1:1 district_code using gr5_2011
drop _merge
merge 1:1 district_code using gr8_2011
drop _merge
drop county_code county_name

save gr11_c
clear


//renaming varisables for years 
use gr11_c
rename total_ppl3_10 total_ppl3_11 
rename total_pl3_10 total_pl3_11
rename total_apl3_10 total_apl3_11
rename total_tsl3_10 total_tsl3_11

rename total_ppm3_10 total_ppm3_11
rename total_pm3_10 total_pm3_11
rename total_apm3_10 total_apm3_11
rename total_tsm3_10 total_tsm3_11


rename total_ppl5_10 total_ppl5_11 
rename total_pl5_10 total_pl5_11
rename total_apl5_10 total_apl5_11
rename total_tsl5_10 total_tsl5_11

rename total_ppm5_10 total_ppm5_11
rename total_pm5_10 total_pm5_11
rename total_apm5_10 total_apm5_11
rename total_tsm5_10 total_tsm5_11

rename total_ppl8_10 total_ppl8_11 
rename total_pl8_10 total_pl8_11
rename total_apl8_10 total_apl8_11
rename total_tsl8_10 total_tsl8_11

rename total_ppm8_10 total_ppm8_11
rename total_pm8_10 total_pm8_11
rename total_apm8_10 total_apm8_11
rename total_tsm8_10 total_tsm8_11

save, replace
clear
*************************
*************************
*************************
//year 2012

//importing the data and saving the files
import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr3_2012.xls", sheet("Total and Instructional Groups")
save gr3_2012
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr5_2012.xls", sheet("Total and Instructional Groups")
save gr5_2012
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr8_2012.xls", sheet("Total and Instructional Groups")
save gr8_2012
clear

//using ado files to shape the files
use gr3_2012
ado1 
save, replace
clear 

use gr5_2012
ado1
ado2
save, replace
clear

use gr8_2012
ado1
ado3
destring county_code, replace
save, replace
clear

//merging the files for 2012

use gr3_2012
merge 1:1 district_code using gr5_2012
drop _merge
merge 1:1 district_code using gr8_2012
drop _merge
drop county_code county_name

save gr12_c
clear


//renaming varisables for years 
use gr12_c
rename total_ppl3_10 total_ppl3_12 
rename total_pl3_10 total_pl3_12
rename total_apl3_10 total_apl3_12
rename total_tsl3_10 total_tsl3_12

rename total_ppm3_10 total_ppm3_12
rename total_pm3_10 total_pm3_12
rename total_apm3_10 total_apm3_12
rename total_tsm3_10 total_tsm3_12


rename total_ppl5_10 total_ppl5_12 
rename total_pl5_10 total_pl5_12
rename total_apl5_10 total_apl5_12
rename total_tsl5_10 total_tsl5_12

rename total_ppm5_10 total_ppm5_12
rename total_pm5_10 total_pm5_12
rename total_apm5_10 total_apm5_12
rename total_tsm5_10 total_tsm5_12

rename total_ppl8_10 total_ppl8_12 
rename total_pl8_10 total_pl8_12
rename total_apl8_10 total_apl8_12
rename total_tsl8_10 total_tsl8_12

rename total_ppm8_10 total_ppm8_12
rename total_pm8_10 total_pm8_12
rename total_apm8_10 total_apm8_12
rename total_tsm8_10 total_tsm8_12

save, replace
clear

*************************
*************************
*************************
//year 2013

//importing the data and saving the files
import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr3_2013.xls", sheet("Total and Instructional Groups")
save gr3_2013
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr5_2013.xls", sheet("Total and Instructional Groups")
save gr5_2013
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr8_2013.xls", sheet("Total and Instructional Groups")
save gr8_2013
clear


//using ado files to shape the files
use gr3_2013
ado1 
save, replace
clear 

use gr5_2013
ado1
ado2
save, replace
clear

use gr8_2013
ado1
ado3
destring county_code, replace
save, replace
clear

//merging the files for 2013

use gr3_2013
merge 1:1 district_code using gr5_2013
drop _merge
merge 1:1 district_code using gr8_2013
drop _merge
drop county_code county_name

save gr13_c
clear

//renaming varisables for years 
use gr13_c
rename total_ppl3_10 total_ppl3_13 
rename total_pl3_10 total_pl3_13
rename total_apl3_10 total_apl3_13
rename total_tsl3_10 total_tsl3_13

rename total_ppm3_10 total_ppm3_13
rename total_pm3_10 total_pm3_13
rename total_apm3_10 total_apm3_13
rename total_tsm3_10 total_tsm3_13


rename total_ppl5_10 total_ppl5_13 
rename total_pl5_10 total_pl5_13
rename total_apl5_10 total_apl5_13
rename total_tsl5_10 total_tsl5_13

rename total_ppm5_10 total_ppm5_13
rename total_pm5_10 total_pm5_13
rename total_apm5_10 total_apm5_13
rename total_tsm5_10 total_tsm5_13

rename total_ppl8_10 total_ppl8_13 
rename total_pl8_10 total_pl8_13
rename total_apl8_10 total_apl8_13
rename total_tsl8_10 total_tsl8_13

rename total_ppm8_10 total_ppm8_13
rename total_pm8_10 total_pm8_13
rename total_apm8_10 total_apm8_13
rename total_tsm8_10 total_tsm8_13

save, replace
clear

*************************
*************************
*************************
//year 2014

//importing the data and saving the files
import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr3_2014.xls", sheet("Total and Instructional Groups")
save gr3_2014
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr5_2014.xls", sheet("Total and Instructional Groups")
save gr5_2014
clear

import excel "C:\Users\Shourjya Deb\Dropbox\new jersey test scores\raw data\gr8_2014.xls", sheet("Total and Instructional Groups")
save gr8_2014
clear

//using ado files to shape the files
use gr3_2014
ado1 
save, replace
clear 

use gr5_2014
ado1
ado2
save, replace
clear

use gr8_2014
ado1
ado3
destring county_code, replace
save, replace
clear

//merging the files for 2014

use gr3_2014
merge 1:1 district_code using gr5_2014
drop _merge
merge 1:1 district_code using gr8_2014
drop _merge
drop county_code county_name

save gr14_c
clear

//renaming varisables for years 
use gr14_c
rename total_ppl3_10 total_ppl3_14 
rename total_pl3_10 total_pl3_14
rename total_apl3_10 total_apl3_14
rename total_tsl3_10 total_tsl3_14

rename total_ppm3_10 total_ppm3_14
rename total_pm3_10 total_pm3_14
rename total_apm3_10 total_apm3_14
rename total_tsm3_10 total_tsm3_14


rename total_ppl5_10 total_ppl5_14 
rename total_pl5_10 total_pl5_14
rename total_apl5_10 total_apl5_14
rename total_tsl5_10 total_tsl5_14

rename total_ppm5_10 total_ppm5_14
rename total_pm5_10 total_pm5_14
rename total_apm5_10 total_apm5_14
rename total_tsm5_10 total_tsm5_14

rename total_ppl8_10 total_ppl8_14 
rename total_pl8_10 total_pl8_14
rename total_apl8_10 total_apl8_14
rename total_tsl8_10 total_tsl8_14

rename total_ppm8_10 total_ppm8_14
rename total_pm8_10 total_pm8_14
rename total_apm8_10 total_apm8_14
rename total_tsm8_10 total_tsm8_14

save, replace
clear

use gr10_c
merge 1:1 district_code using gr11_c
drop _merge
merge 1:1 district_code using gr12_c
drop _merge
merge 1:1 district_code using gr13_c
drop _merge
merge 1:1 district_code using gr14_c
drop _merge
save njtest_cons
clear
