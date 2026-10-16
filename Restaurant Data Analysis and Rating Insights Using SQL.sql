select * from salesman
select * from customer
select* from orders



CREATE TABLE Salesman (
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);

CREATE TABLE Customer (
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
);

INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);

CREATE TABLE Orders 
(
OrderId int,
CustomerId int, 
SalesmanId int, 
Orderdate Date, 
Amount float
)

INSERT INTO Orders Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

--1--Insert a new record in your Orders table.

INSERT INTO Orders Values
(5005,2346,106,'2023-03-21',2550)

--2--Add Primary key constraint for SalesmanId column in Salesman table. Add default 
--constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId 
--column in Customer table. Add not null constraint in Customer_name column for the 
--Customer table.

--Add Primary key constraint for SalesmanId column in Salesman table.  

1st we have to add notnull value to the salesmanid column, then we can add primary key constraint.

alter table salesman
alter column salesmanid int not null;

alter table salesman
add constraint pk_sales primary key (salesmanid);

--Add default constraint for City column in Salesman table.

alter table salesman
add constraint default_city_name default 'new_york' for city

 --Add Foreign key constraint for SalesmanId column in Customer table.

 alter table customer
 add constraint fk_salesid foreign key (salesmanid) references salesman(salesmanid)

 --Add not null constraint in Customer_name column for the Customer table.

alter table customer
alter column customername varchar(255) not null;

--3--Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500.

select * from customer
where customername like '%N'
AND PurchaseAmount > 500

select * from customer

--4--using SET operators, retrieve the first result with unique SalesmanId values from two tables,and the other result containing SalesmanId with duplicates from two tables.


  a)results with unique salesmanid values from two tables
  
  select salesmanid FROM salesman
  union 
  select salesmanid from orders

  b)results containing Salesmanid values from two tables

  select salesmanid from salesman
  intersect
  select salesmanid from orders

 --5--Display the below columns which has the matching data.
 --Orderdate, Salesman Name, Customer Name, Commission, and City which has the range of 
 --Purchase Amount between 500 to 1500.

select orderdate,name,customername,commission,city
from orders o
join customer c on (o.customerid=c.customerid)
join salesman s on (s.salesmanid=o.salesmanid)
where PurchaseAmount between 500 and 1500

--6--Using right join fetch all the results from Salesman and Orders table

select * 
from salesman s
right join orders o
on (s.salesmanid=o.salesmanid)