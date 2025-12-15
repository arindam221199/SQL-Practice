-- Case Statement
/* Generate a report showing the total sales for each category:
- High: If the sales higher than 50
- Medium: If the sales between 20 and 50
- Low: If the sales equal or lower than 20
Sort the result from lowest to highest. */
Select
Category,
Sum(Sales) AS TotalSales
From(
	Select
	OrderID,
	Sales,
	Case
		When Sales > 50 Then 'High'
		When Sales > 20 Then 'Medium'
		Else 'Low'
	End As Category 
	From Sales.Orders
)t
Group BY Category
Order By TotalSales Desc


/* Retrieve employee details 
with gender displayed as full text */
Select
EmployeeID,
Case
	When Gender = 'M' Then 'Male'
	Else 'Female'
End As Gender
From Sales.Employees


/* Retrieve customer details with abbreviated country code */
Select
CustomerID,
FirstName,
LastName,
Score,
Case
	When Country = 'Germany' Then 'DE'
	Else 'US'
End AS Country_ABB
From Sales.Customers


/* Find the average scores of customers and treat Nulls as O
And additional provide details such CustomerID & LastName */
Select
CustomerID,
LastName,

Case
	When Score IS Null Then 0
	Else score
End AS ScoreClean,

Avg(Case
	When Score IS Null Then 0
	Else score
End) over () AS Avg_Score
From Sales.Customers