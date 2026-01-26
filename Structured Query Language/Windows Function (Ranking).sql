-- a) Row_Number()

/* Rank the orders based on their sales
from highest to lowest. */
Select
	Sales,
	ROW_NUMBER() over (Order By Sales Desc)
From Sales.Orders

/* Find the top highest sales for each product. */
-- Use case of Top N Analysis
Select
*
From (
	Select
		OrderID,
		ProductID,
		Sales,
		Row_Number() Over (Partition By ProductId Order By Sales Desc) As RankByProduct
	From Sales.Orders
) t Where RankByProduct = 1

/* Find the lowest2 customers
based on their total sales */
-- Use case of Bottom N Analysis
Select
*
From (
	Select
		CustomerId,
		Sum(Sales) As TotalSales,
		Row_Number() over (Order By Sum(Sales)) As RankingCustomers
	From Sales.Orders
	Group By CustomerID
) t Where RankingCustomers <= 2

/* Identify duplicate rows in the table Order Archive
and return a clean result without any duplicate */
Select
*
From (
Select
	ROW_NUMBER() Over(Partition By OrderId Order By CreationTime) As RN,
	*
From Sales.OrdersArchive
) t 
Where RN = 1


-- b) Rank()
/* Rank the orders based on their sales
from highest to lowest using rank function. */
Select
	Sales,
	Rank() over(order by Sales Desc)
From Sales.Orders


-- c) Dense_Rank()
/* Rank the orders based on their sales
from highest to lowest using dense rank function */
Select
	Sales,
	Dense_Rank() over(order by Sales Desc)
From Sales.Orders


-- d) NTILE()
Select
	OrderID,
	Sales,
	NTILE(1) Over (Order By Sales Desc) As OneBucket,
	NTILE(2) Over (Order By Sales Desc) As TwoBucket,
	NTILE(3) Over (Order By Sales Desc) As ThreeBucket,
	NTILE(4) Over (Order By Sales Desc) As FourBucket
From Sales.Orders

/* Segment all orders into 3 categories:
high, medium and Iow sales */
Select
	*,
	CASE When Bucket = 1 Then 'High'
		 When Bucket = 2 Then 'Medium'
	     When Bucket = 3 Then 'Low'
	End SalesSegmentation
From (
Select
	OrderID,
	Sales,
	NTILE(3) Over(Order By Sales Desc) as Bucket
From Sales.Orders
) t


-- e) Cume_Dist()
/* Find the products that fall within
the highest 40% of prices */
Select
*
From (
Select
	Product,
	Price,
	CUME_DIST() Over(Order By Price Desc) DistRank
From Sales.Products
) t
Where DistRank <= 0.4


-- f) Percent_Rank()
Select
*
From (
Select
	Product,
	Price,
	Percent_Rank() Over(Order By Price Desc) DistRank
From Sales.Products
) t
Where DistRank <= 0.4