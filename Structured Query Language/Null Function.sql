-- ISNULL function() and Coalesce function()
/* Find the average scores of the customers */
Select 
	CustomerID,
	avg(coalesce(score, 0)) Over () Avg_Score
from Sales.Customers


/* Display the full name of customers in a single field
by merging their first and last names,
and add 10 bonus points to each customer's score. */
Select
	FirstName + ' ' + coalesce(LastName, '') AS FullName,
	10 + coalesce(score, 0) AS BonusScore
from Sales.Customers


--NullIf function()
/* Find the sales price for each order by
dividing the sales by the quantity. */
Select 
	OrderID,
	Sales,
	Quantity,
	sales / NullIF(Quantity, 0) AS Price
from Sales.Orders


-- IS Null function() and IS Not Null function()
/* Identify the customers who have no score. */
Select *
from Sales.Customers
Where score IS Null


/* List all customers who have scores. */
Select *
From Sales.Customers
Where score Is Not Null