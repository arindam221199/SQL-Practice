-- No Join
/* Retrieve all data from customers
and orders as separate results. */
Select * 
From customers

Select *
From orders

-- Inner Join
/* Get all customers along with their orders,
but only for customers who have placed an order. */
Select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
From customers AS c
Inner Join orders AS o
ON c.id = o.customer_id

-- Left Join
/* Get all customers along with their orders,
including those without orders. */
Select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
From customers as c
Left Join orders as o
ON c.id = o.customer_id

-- Right Join
/* Get all customers along with their orders,
including orders without matching customers. */
Select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
From customers as c 
Right Join orders as o
ON o.customer_id = c.id

-- Full Join
/* Get all customers and all orders,
even if there's no match. */
Select *
From customers as c 
Full Join orders as o
ON o.customer_id = c.id

-- Left Anti Join
/* Get all customers who haven't placed any order. */
Select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
From customers as c
Left Join orders as o
ON c.id = o.customer_id
Where o.customer_id IS NULL

-- Right Anti Join
/* Get all orders without matching customers. */
Select *
From customers as c 
Right Join orders AS o
ON o.customer_id = c.id
Where c.id IS NULL

-- Full Anti Join
/* Find customers without orders
and orders without customers. */
Select *
From customers as c
Full Join orders as o
ON c.id = o.customer_id
Where
	c.id IS NULL
	OR
	o.customer_id IS NULL

-- Question
/* Get all customers along with their orders,
but only for customers who have placed an order,
(Without Using INNER JOIN) */
Select *
From customers as c
Left JOIN orders as o
ON c.id = o.customer_id
Where o.customer_id IS NOT NULL

-- Cross Join
/* Generate all possible combinations of
customers and orders. */
Select *
From customers
Cross Join orders

-- Question
/* Using SalesDB, Retrieve a list of all orders, along with
the related customer, product, and employee details.
For each order, display:
- Order ID
- Customer's name
- Product name
- Sales amount
- Product price
- Salesperson's name */

/* Use SalesDB

Select * from Sales.Customers
Select * from Sales.Employees
Select * from Sales.Orders
Select * from Sales.Products

Select
	o.OrderID,
	(c.FirstName + ' ' + c.LastName) AS CustomerName,
	p.Product AS ProductName,
	(o.Quantity * o.Sales) AS SalesAmount,
	p.Price AS ProductPrice,
	(e.FirstName + ' ' + e.LastName) AS SalespersonName
From Sales.Orders as o
Left Join Sales.Customers as c
ON o.CustomerID = c.CustomerID
Left Join Sales.Products as p
ON o.ProductID = p.ProductID
Left Join Sales.Employees as e
ON o.SalesPersonID = e.EmployeeID
*/