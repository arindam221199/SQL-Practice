/* Create a new table called persons
with columns: 
	id, 
	person_name, 
	birth_date, 
	and phone 
*/

Create Table persons (
	id Int Not Null,
	person_name Varchar(50) not null,
	birth_date Date,
	phone Varchar(15) Not Null,
	Primary Key(id)
)

-- Add a new column called email to the persons table
Alter Table persons
Add email Varchar(50) Not Null

Select * from persons

-- Remove the column phone from the persons table
Alter Table persons
Drop Column phone

-- Delete the table persons from the database
Drop Table persons