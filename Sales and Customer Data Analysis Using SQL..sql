---1--Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.
 

create or alter function stuff_chickens
(@inputphrase nvarchar(100),@insertparameter nvarchar(100))
returns nvarchar(100)
as
begin
 declare @firstcharacter nvarchar(100);
 declare @secondcharacter nvarchar(100);
 declare @result nvarchar(100);

 set @firstcharacter = left(@inputphrase,charindex(' ',@inputphrase+' ') -1)
 set @secondcharacter = ltrim(right(@inputphrase,len(@inputphrase) - len(@firstcharacter)))
 set @result = @firstcharacter+' ' + @insertparameter +' '+ @secondcharacter

 return @result
end

select dbo.stuff_chickens ('Quick bites','chicken') stuff_chicken_names

--2-Use the function to display the restaurant name and cuisine type which has the maximum number of rating.

use sun_session
select * from jomato

select top 3 restaurantname,cuisinestype,rating 
from jomato
where rating=(select max(rating) from jomato)

--3--Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 start rating, ‘Good’ if it has above 3.5 and below 4 star rating, ‘Average’ if it is above 3 and below 3.5 and ‘Bad’ if it is below 3 star rating

create or alter function getratingstatus
(@rating float)
returns nvarchar(50)
as
begin
declare @status nvarchar(50);
 if @rating>4
 set @status='Excellent';
 else if @rating>3.5
 set @status='Good';
 else if @rating>3
 set @status='Average';
 else
 set @status='Bad';
 return @status
end;

select Restaurantname,CuisinesType,Rating,
dbo.getratingstatus(rating) as Rating_status
From jomato

--4--Find the Ceil, floor and absolute values of the rating column and display the current date and separately display the year, month_name and day.

select rating, ceiling(rating) ceil_rating,
floor(rating) floor_rating,
abs(rating) abs_rating
from jomato

select getdate() as currentdate,
year(getdate()) as year,
datename(month,getdate()) as month_name,
day(getdate()) as day

--5--Display the restaurant type and total average cost using rollup.

select * from jomato

select restaurantType,sum(averagecost) as total_avg_cost
from jomato
group by rollup(restaurantType)





