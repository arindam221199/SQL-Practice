-- Ways to query date:
-- a) Date column from table
Select
	OrderId,
	OrderDate,
	ShipDate,
	CreationTime
From Sales.Orders

-- b) Hardcoded constant string value
Select
	OrderId,
	CreationTime,
	'2025-08-20' As HardCoded
From Sales.Orders

-- c) GETDATE()
Select GETDATE() As Toady


-- Functions
-- a) Date(), Month() & Year functions()
Select
	OrderId,
	CreationTime,
	YEAR(CreationTime) As Year,
	Month(CreationTime) As Month,
	Day(CreationTime) As Day
From Sales.Orders


-- b) Datepart function()
Select
	OrderId,
	CreationTime,
	Datepart(year, CreationTime),
	Datepart(MONTH, CreationTime),
	Datepart(DAY, CreationTime),
	Datepart(HOUR, CreationTime),
	Datepart(QUARTER, CreationTime),
	Datepart(WEEK, CreationTime)
From Sales.Orders


-- c) DateName function()
Select
	OrderId,
	CreationTime,
	DateName(WEEKDAY, CreationTime),
	DateName(MONTH, CreationTime)
From Sales.Orders


-- d) DateTrunc function()
Select
	OrderId,
	CreationTime,
	DateTrunc(MINUTE, CreationTime) as Min_dt,
	DateTrunc(MONTH, CreationTime) as Month_dt
From Sales.Orders


-- e) EoMonth function()
Select
	OrderId,
	CreationTime,
	EoMonth(CreationTime) as Last_Day
From Sales.Orders


-- f) Format function()
Select
	OrderId,
	CreationTime,
	Format(CreationTime,'dd'),
	Format(CreationTime,'ddd'),
	Format(CreationTime,'MM-dd-yyyy')
From Sales.Orders


-- g) Convert function()
Select
	CONVERT(Int, '123') as [String to Int],
	Convert(Date, '2025-08-20') as [String to Date],
	Convert(Date, CreationTime) AS [DateTime to Date]
From Sales.Orders


-- h) Cast function()
Select
	Cast('123' As INT),
	Cast('2025-08-20' AS DATE)


-- i) DateAdd function()
Select
	DATEADD(year, 3, OrderDate),
	DATEADD(month, 2, OrderDate),
	DATEADD(month, -3, OrderDate)
From Sales.Orders


-- j) DateDiff function()
Select
	BirthDate,
	DATEDIFF(year, BirthDate, GETDATE()) As Age
From Sales.Employees


-- k) IsDate function()
Select 
	IsDate('123'),
	IsDate('2025-08-20')
