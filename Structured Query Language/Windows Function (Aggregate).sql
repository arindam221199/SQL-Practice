/* Find the total sales for each product
Additionally provide details such 
order Id, order date. */
Select
	OrderID,
	OrderDate,
	ProductID,

	Sum(sales) over(Partition By ProductId) AS TotalSales

From Sales.Orders


/* Find the total sales across all orders
Find the total sales for each product
Find the total sales for each combination of product and order status
Additionally provide details such order Id, order date */
Select
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,

	sum(sales) over() As [Total Sales by Order],
	Sum(sales) over(Partition By productid) AS [Total Sales By Product],
	Sum(sales) over(Partition By productid, orderstatus) As [Total Sales By Product and Status]

From Sales.Orders


/*  Rank each order based on their sales
from highest to lowest,
additionally provide details such 
order id & order date */
Select
OrderID,
OrderDate,
Sales,

Rank() over(order by sales Desc) As Ranking

From Sales.Orders


-- Using frame clause
Select
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,

	Sum(sales) over(Partition By OrderStatus Order By OrderDate
	Rows Between Current Row And 2 Following) AS [Total Sales]

From Sales.Orders


/* Rank customers based on their total sales. */
-- Window function with group by
Select
	CustomerID,

	sum(sales) AS TotalSales,
	Rank() over(Order By sum(sales) Desc)

From Sales.Orders
Group By CustomerID


-----------------------------------------------------------------------------------------------------------------------------------------------


-- Aggregrate Function
-- a) Count()
/* Find the total number of orders
Find the total number of Orders for each customers
Additionally provide details such order Id, order date */
Select
	OrderID,
	OrderDate,
	CustomerID,

	Count(*) over() AS TotalOrders,
	Count(*) over(Partition By customerid) AS OrdersByCustomers

From Sales.Orders


-- b) Sum()
/* Find the total sales across all orders
and the total sales for each product.
Additionally, provide details such as order ID and order date. */
Select
	OrderID,
	OrderDate,
	ProductID,

	Sum(Sales) over () As TotalSales,
	Sum(Sales) Over (Partition By ProductId) As TotalSalesOfProduct

From Sales.Orders


/* Find the percentage contribution of
each product's sales to the total sales */
Select
	OrderID,
	ProductID,
	Sales,

	Sum(sales) over () As TotalSales,
	Round(Cast (Sales As Float) / Sum(sales) over () * 100 , 2) As PercentTotal

From Sales.Orders


-- c) Avg()
/* Find the average sales across all orders
and the average sales for each product.
Additionally, provide details such as order ID and order date. */
Select
	OrderId,
	OrderDate,
	Sales,
	Avg(Sales) Over () AvgSales,
	Avg(Sales) Over(Partition By ProductId) AvgSalesByProduct
From Sales.Orders


/* Find the average scores of customers.
Additionally, provide details such as Customer ID and Last Name. */
Select
	CustomerID,
	LastName,
	Avg(Coalesce(Score, 0)) Over () AvgScore
From Sales.Customers


/* Find all orders where sales
are higher than the average sales across all orders. */
Select
*
From(
	Select
		ProductID,
		Sales,
		Avg(Sales) over() As AvgSales
	From Sales.Orders
) t
Where Sales > AvgSales


-- d) Min() & Max()
/* Find the highest & lowest sales across all orders
and the highest & lowest sales for each product.
Additionally, provide details such as order ID and order date. */
Select
	ProductId,
	OrderID,
	OrderDate,
	
	Min(Sales) Over() AS MinSales,
	Max(Sales) Over() AS MaxSales,
	Min(Sales) Over(Partition By ProductId) AS MinSalesByProduct,
	Max(Sales) Over(Partition By ProductId) AS MaxSalesByProduct

From Sales.Orders


/*  Show the employees with the highest salaries */
Select
	*
From(
	Select
		*,
		Max(Salary) Over() AS HighestSalary
	From Sales.Employees
) t
Where Salary = HighestSalary


-- Special mention: Running total and rolling total
-- Running Total
/* Calculate the moving average of sales
for each product over time */
Select
	OrderID,
	ProductID,
	OrderDate,
	Sales,
	Avg(Sales) Over(Partition By ProductId Order By OrderDate) As MovingAvg
From Sales.Orders


-- Rolling Total
/* Calculate the moving average of sales for each
product over time, including only the next order. */
Select
	OrderID,
	ProductID,
	OrderDate,
	Sales,
	Avg(Sales) Over(Partition By ProductId Order By OrderDate Rows Between CURRENT ROW And 1 FOLLOWING) As RollingAvg
From Sales.Orders


-----------------------------------------------------------------------------------------------------------------------------------------------


