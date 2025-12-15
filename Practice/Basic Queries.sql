/* Lets
start SQL
*/

-- Change database
Use MyDatabase

-- Retrieve all data
Select * 
from customers

-- Retrive speciifed columns
Select
	first_name, 
	country
from customers

-- Retrieve all data with condition
Select *
From customers
Where score != 0

Select *
From customers
Where country = 'Germany'

-- Sort the data
Select *
From customers
Order By score desc

-- Nested sorting
Select *
From customers
Order By
	country Asc,
	score Desc

-- Grouping data (using sum)
Select 
	country,
	sum(score) as totalScore
From customers
Group By country

-- Grouping data by total score and total no of cutsomers (using sum and count)
Select
	country,
	sum(score) as totalScore,
	count(id) as totalCustomers
From customers
Group By country

-- Having
/*
Find the average score for each country
considering only customers with a score not equal to 0
and return only those countries with an average score greater than 430
*/
Select
	country,
	AVG(score) as Avg_Score
From customers
Where score != 0
Group By country
Having Avg(score) > 430

-- Select uniquely
Select
Distinct country
From customers

-- Limited rows selection
/* Retrieve the Top 3 Customers with the Highest Scores */
Select
Top 3 *
From customers
Order By score Desc