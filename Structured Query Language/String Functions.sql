-- Concat
/* Concatenate first name and country into one column */
Select
concat(first_name,' ', country) AS name_country
From customers


-- Upper & Lower
/* Convert the first name to lowercase & uppercase */
Select
	lower(first_name) AS low_name,
	upper(first_name) As up_name
From customers


-- Trim
/* Find customers whose first name
contains leading or trailing spaces */
Select
first_name
From customers
Where first_name != Trim(first_name)


-- Replace
/* Replace (-) from the phoen numbers to (/) */
Select
'123-456-7890' AS phone,
REPLACE('123-456-7890', '-', '/')

-- Length
/* Calculate the length of each customer's first name */
Select
	first_name,
	len(first_name) AS name_length
From customers


-- Left & Right
/* Retrieve the first two characters and last two of each first name */
Select
	first_name,
	left(trim(first_name), 2) As start_name,
	right(first_name, 2) As end_name
From customers


-- Substring
/* Retrieve a list of customers first names
removing the first character */
Select
	first_name,
	SUBSTRING(trim(first_name), 2 , len(first_name)) AS sub_name
From customers