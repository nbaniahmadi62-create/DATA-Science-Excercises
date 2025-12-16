this folder contains Power BI projcets and Dashboords.


PROJECT Car Dashboard :
Power BI Dashboard 2025 | Car Sales Analysis Project | End to End Power BI Tutorial for Beginners
 
This is what you will learn in the end:
 
Level One: Preparation
•	Connect to our data 
•	Cleaning data & verifying data quality  
o	Does this Data Set require to cleaning?
o	For checking we have a tool in Power BI  power query
o	Home/Transform Data/ open new window 
o	View / applied setup  for view changing on data set on the right (its suitable for teamwork)
o	View /check two checkbox 
 
o	If valid equals with 100%, so data is ok. not error, not empty
o	We must clean data in the source for example in excel or SQL server 
o	Chek primary key to be distinct and unique
o	 
o	Distinct & Uniq mean what? each and every row is having distinct and unique value. Unique means: Values that appear only once in the entire set. Distinct means: A set of non-repeating values; that is, each value appears only once, even if it appears multiple times in the table.
 
o	About Date column: you always check don’t have not null & not duplicate.
o	For cleaning data use Trim & Replace for correct value.
o	Close & Apply  for save changes on dataset
Now let's get to Problem statement
 
Microsoft Power BI recommend us whenever you are working on “year to date “or Time Intelligent function it is always e better  to create a calendar Table or Data Table.
Almost in main data set and data column not continuously value of time because of holydays or weekends,… but in Data Table we create table will have all the data set from stat to end . It will give us an ability too perform different operations and it will give us ability to perform different date. So it is always recommended and nowadays in every model , every domain and every project we generally use the AI date or DATA Table .
o	How create Data Table || calendar Table 
Home / new Table 
 
Next type :
 
 Add more columns
Extract year:  
Extract Month:
 
Extract week:
 
o	Modeling 
Make relation between Car_date & Calendar Table
 
Finally, we delivered Car Dashboard like this: 
o	Set Background canvas  
o	
o	we must find out what the problem statement  is asking for!
 
For find some value, inevitably we going to make use of DAX functions and we must build measure.
o	Right Click on car_date
 
o	TOTALYTD  

o	TOTALMTD 

o	GROWTH ANUALLY  

MAKE CONDITION on GROWTH ANUALY IF VALUE WAS POSITIVE TO BE GREEN  AND VALUE WAS NEGETIVE TO BE RED 

o	DIFFERENT  


o	second partition :
 
First, find the average total price.  
Then we calculate the average price from the beginning of the year to now.
  
o	MTD AVG PRICE
 
Before this measure we must make a measure for calculate MTD AVRAGE   
o	Different between YTD aavg price and PYTD avg price
 
Required measures:
 
To compare the average price of this year and last year, we need the average price of last year.
 
 



o	YoY Growth in average price:
  

•	Third partition
 
o	YTD cars sold
 
o	MTD cars sold
  
o	YOY GROWTH IN CARS SOLD
      
o	DIFFERENCE YTD & PYTD CARS SOLD
   

•	DISPLAY CHART 
 
o	YTD TOTAL SALES WEEKLY TREND
 
	 For find max point on the line chart:  
We will max point as per price point so  we will be change color’s the max point. We must write calculate for this  .Write measure:  using   if function because it is always needing a logical test and using Maxx 

 
 
FINALY SHOW MAX POINT  
o	YTD TOTAL SALES BY BODY STYLE 

o	YTD CARS SOLD BY DEALER REGION  

o	YTD CARS SOLD BY DEALER REGION:


  

o	COMPANY – WISE SALES TREND IN GRID FORM
 
   
 

•	Filters  
  
•	Bookmark Navigation linke between pages.
•	 
