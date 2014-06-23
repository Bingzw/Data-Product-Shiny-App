Hospital Inpatient Prevention Quality Indicators for Adults by zipcode from 2009-2012 in New York State
========================================================

Introduction
--------------------------------------------------------
This is an application of presenting the observe/expected rate of 17 kinds of disease recored from 2009 to 2012 in New York state. We acquired the raw data from https://health.data.ny.gov/api/views/5q8c-d6xq/rows.csv?accessType=DOWNLOAD. In this data set, we can find out the observe/expected rate of a certain kind of disease for a certain year (among 2009-2012) and a certain district (some zipcode in NY). 

The goal of this app is to fulfill the following functions:

1. Fix a year in 2009-2012 and a certain kind of disease, show the geographically distribution of observe rate of the disease in NY state. 

2. Fix a year in 2009-2012 and some district in NY state(zipcode), show the relative observe/expected rate among these 17 kinds of disease.

3. Fix a certain kind of disease and some district in NY state(zipcode), show the trend of observe/expected rate of the disease from 2009-2012. 

--------------------------------------------------------

How to use this app?
--------------------------------------------------------

This app show you three parts. The left side panel, main panel and the part down below them.

* In the left side panel, you can: 

  * select an input year from 2009 - 2012
  
  * select a certain kind of disease (17 kinds in total)
  
  * select some distrct in NY state by zipcode

* According to your selection above, we can show you:
  
  * function 1 in the main panel
  
  * function 2 in the area down below the main panel and left side panel
  
  * function 3 in the left side panel
  
--------------------------------------------------------

Note: 
--------------------------------------------------------
* In the data cleaning setp, we exclude those statewide observations

* The unit of observe/expected rate is per 100,000 people 

--------------------------------------------------------
