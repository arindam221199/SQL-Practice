-- a) Lag()
/* Analyze the month-over-month (MOM) performance
by finding the percentage change in sales
between the current and previous month. */
Select
*,
Current_Month_Sale - Previous_Month_Sales AS MoM_Change,
Round(Cast((Current_Month_Sale - Previous_Month_Sales)As Float)/ Previous_Month_Sales * 100, 1) AS MoM_Percentage
From (
	Select
		Month(OrderDate) As Order_Month,
		Sum(Sales) As Current_Month_Sale,
		Lag(Sum(Sales)) Over (Order By Month(OrderDate)) AS Previous_Month_Sales
	From Sales.Orders
	Group By Month(OrderDate)
) t

-- b) Lead()
/* Analyze customer loyalty by ranking customers
based on the average number of days between orders */
Select
	CustomerID,
	Avg(DaysUntilNextOrder) As AvgDays,
	Rank() Over(Order By Coalesce(Avg(DaysUntilNextOrder), 9999999999999999999)) As RankAvg
From (
	Select
		CustomerID,
		OrderDate As CurrentOrder,
		Lead(OrderDate) Over(Partition By CustomerID Order By OrderDate) AS NextOrder,
		DateDiff(day, OrderDate, Lead(OrderDate) Over(Partition By CustomerID Order By OrderDate)) DaysUntilNextOrder
	From Sales.Orders
) t
Group By CustomerID

-- c) First_Value() & d) Last_Value()
/* Find the lowest and highest sales for each product. */
Select
	OrderID,
	ProductID,
	Sales,
	First_Value(Sales) Over(Partition By ProductID Order By Sales) LowestSales,
	LAST_VALUE(Sales) Over(Partition By ProductID Order By Sales 
	Rows Between Current Row And unbounded Following) HighestSales
From Sales.Orders