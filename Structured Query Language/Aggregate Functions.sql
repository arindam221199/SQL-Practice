Select
	CustomerID,
	Count(*) AS TotalOrders,
	Sum(Sales) AS TotalSales,
	Avg(Sales) AS AvgSales,
	Max(sales) AS MaxSales,
	Min(Sales) AS MinSales
From Sales.Orders
Group BY CustomerID