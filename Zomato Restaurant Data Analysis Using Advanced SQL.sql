--1. Create a stored procedure to display the restaurant name, type and cuisine where the
 --table booking is not zero.

 CREATE OR ALTER PROCEDURE <PROCEDURE_NAME>
(PARAMETERS IF ANY)
AS 
BEGIN 
 ..
 ..
END

create or alter procedure restaurants_display
as
begin
 select restaurantname,restauranttype,cuisinestype
 from jomato
 where tablebooking<>0 
end

execute restaurants_display

--2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.

Begin transaction

update jomato
set cuisinestype='cafeteria'
where cuisinestype='cafe';

select restaurantname,restauranttype,cuisinestype
from jomato
where cuisinestype='cafeteria';

rollback;

--3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.
 select * from jomato
 
 with highest_restaurants_rating as (
 select area,max(rating) as max_rating,
 row_number() over (order by max(rating) desc) as row_num_column
 from jomato
 group by area
 )
 select area,max_rating,row_num_column
 from highest_restaurants_rating
 where row_num_column<=5;
 
--4. Use the while loop to display the 1 to 50.
 
Declare @numbers int=1;
while @numbers <= 50
begin
  print @numbers;
  set @numbers = @numbers + 1;
end;
 
--5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.

create view Top_ratings as
select top 5 restaurantname,restauranttype,cuisinestype,rating
from jomato
order by rating desc

select * from Top_ratings

--6. Create a trigger that give an message whenever a new record is inserted.

create trigger trigger_message
on jomato
after insert
as 
begin
 print 'New record has been inserted successfully';
end;

