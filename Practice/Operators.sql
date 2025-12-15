/* Compariosn Operators */
-- Comparison Operator (=)
Select *
From customers
Where country = 'Germany'

-- Comparison Operator (!=)
Select *
From customers
Where country != 'Germany'

-- Comparison Operator (>)
Select *
From customers
Where score > 500

-- Comparison Operator (>=)
Select *
From customers
Where score >= 500

-- Comparison Operator (<)
Select *
From customers
Where score < 500

-- Comparison Operator (<=)
Select *
From customers
Where score <= 500


/* Logical Operators */
-- Logical Operators (AND)
Select *
From customers
Where
country = 'USA'AND score > 500

-- Logical Operators (OR)
Select *
From customers
Where
country = 'USA'OR score > 500

-- Logical Operators (NOT)
Select *
From customers
Where
Not score < 500


/* Range Operator */
-- Range Operator (Between)
Select *
From customers
Where 
score Between 100 AND 500


/* Membership Operatos */
-- Membership Operator (IN)
Select * 
From customers
Where
country IN ('Germany' , 'USA')

-- Membership Operator (NOT IN)
Select * 
From customers
Where
country NOT IN ('Germany' , 'USA')


/* Search Operator */
-- Search Operator (Like with %)
Select *
From customers
Where 
first_name LIKE 'M%'

-- Search Operator (Like with _)
Select *
From customers
Where 
first_name LIKE '__R%'
