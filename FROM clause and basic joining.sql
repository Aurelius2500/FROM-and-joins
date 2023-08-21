-- Database Basics: FROM clause and basic joining

-- In this video, we will be exploring two tables, notice how the Houses table has an Owner ID column
CREATE TABLE Houses (
Owner_ID VARCHAR(100),
Street VARCHAR(200),
[State] VARCHAR(200),
Price INT,
Price_Date DATE,
Years_since_construction INT
);

INSERT INTO Houses (Owner_ID, Street, [State], Price, Price_Date, Years_since_construction)
VALUES ('1', '240 Main Street', 'CA', 1900000, '2019-01-01', 18), 
('1', '140 Maple Street', 'GA', 1300000, '2021-01-01', 5),
('2', '555 New Way', 'TX', 1100000, '2017-01-01', 12),
('2', '14 Paradise Street', 'MO', 700000, '2020-01-01', 30),
( '4', '123 School Street', 'MI', 400000, '2019-01-01', 18),
('1', '70 Smith Way', 'VA', 1500000, '2012-07-10', 12),
('2', '230 Valley Way', 'TX', 1200000, '2007-02-08', 2),
('1', '23 King Drive', 'CA', 3300000, '2022-04-08', 5),
('3', '12 Felicity Way', 'RI', 2200000, '2017-04-12', 1),
('2', '34 Hollow Drive', 'FL', 1950000, '2019-05-29', 2);

-- Recall that the Houses table has the following columns
-- We have the following columns:
-- Street is the address of the house
-- State is the U.S State in which the house is located
-- Price is the current listed price of the house
-- Price_Date is when the price was retrieved
-- Years_since_construction is how many years have passed since the house was built

-- We will then create a second table called Owners
CREATE TABLE Owners (
Owner_ID VARCHAR(100),
First_Name VARCHAR(100),
Last_Name VARCHAR(100),
Debt INT
);
-- Owner ID is a unique identifier for each owner
-- First_Name is the given name of the owner
-- Last_Name is the family name of the owner
-- Debt is how much debt the owner has in total, if available

-- We will also need to populate the records
INSERT INTO Owners (Owner_ID, First_Name, Last_Name, Debt)
VALUES ('1', 'Jeremy', 'Smith', 150000),
('2', 'Sarah', 'Rich', 300000),
('3', 'Josh', 'Rice', 50000),
('4', 'Monica', 'Monique', 1500000);
-- Let's start by query the Owners table, notice how the FROM clause defines that we are selecting all the columns from Owners
SELECT *
FROM Owners

-- By just changing the table name, we can instead retrieve all records from the Houses table
SELECT *
FROM Houses

-- A join, at its most basic form, takes records from one table, and a match from anothee table
-- The most basic types of joins are INNER, LEFT and RIGHT joins
-- For this video, we will limit ourselves to INNER joins
-- We can ask SQL to retrieve all the columns from both tables at the same time, but we need to specify a key
-- In this case, the key is Owner ID, that it is called the same on both tables
SELECT *
FROM Owners
INNER JOIN Houses
ON Owners.Owner_ID = Houses.Owner_ID

-- The dot is used to identify a column coming from a specific table, as in this case, both tables have a column called Owner ID
-- However, this is not a smart join, we are just bringing all the columns from Owners and then all the columns from Houses
-- Instead, we can bring a subset of columns from both tables, we do not even need the key that is being used to join
SELECT Owners.First_Name, 
Owners.Last_Name, 
Houses.Street, 
Houses.[State],
Houses.Price,
Houses.Years_since_construction
FROM Owners
INNER JOIN Houses
ON Owners.Owner_ID = Houses.Owner_ID

-- Another feature from the FROM clause is the capability of giving an alias to either a table or a column, we can make this query more compact by using aliases
SELECT O.First_Name, 
O.Last_Name, 
H.Street, 
H.[State],
H.Price,
H.Years_since_construction
FROM Owners O
INNER JOIN Houses H
ON O.Owner_ID = H.Owner_ID

-- The query above allows us to give an alias to both the Houses and Owners table, and then it references them by the letters H and O, respectively
-- We can also use aliases on the columns, but that will be for a separate SELECT video
-- The last operation that we want to perform if we will not use the tables anymore is drop them
DROP TABLE Houses;
DROP TABLE Owners;
