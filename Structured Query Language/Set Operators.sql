-- Union
/* Combine the data from
employees and customers into one table. */
Select
FirstName,
LastName
from sales.Customers
Union
Select
FirstName,
LastName
from sales.Employees


-- Except
/* Find employees who are not customers at the same time */
Select
FirstName,
LastName
from sales.Employees
Except
Select
FirstName,
LastName
from sales.Customers


-- Intersect
/* Find employees who are also customers */
Select
FirstName,
LastName
from sales.Employees
Intersect
Select
FirstName,
LastName
from sales.Customers
