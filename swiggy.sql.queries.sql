#Basic Analysis
#1.dispaly all records
select * from swiggy;

#2.Total number of restaurant
select count(*) as total_restaurants from swiggy;

#3.Find all unique cities
select distinct city from swiggy;

#4.Count each restaurants in each city
select city,count(*) as
total_restaurants
from swiggy
group by city
order by total_restaurants desc;

#5.Count Restaurants in each city
select Area,count(*) as 
total_restaurants
from swiggy
group by Area
order by total_restaurants desc;

#2.Data cleaning
#6.Identify duplicate ID's
select ID,count(*)
from swiggy
group by ID
having count(*)>1;

#7.Check Null values
select * from swiggy
where City is null
or Restaurant is null 
or Price is null
or 'Avg ratings' is null;

#8.Identify invalid prices
select * from swiggy where price<=0;

#9.Identify invalid delivery times
select *
from swiggy
Where `Delivery time` <= 0;

#Restaurant Analysis
#10.Highest rated restaurant
select Restaurant,City,'Avg ratings'
from swiggy
order by 'Avg ratings'desc
limit 10;

#11.Most expensive restaurants
select Restaurant,City,Price
from swiggy
order by price desc
limit 10;

#12.Average restaurant price by city
select city,Round(Avg(Price),2) As avg_price
from swiggy
group by city
order by avg_price desc;

#13.Average Rating by city
SELECT City,
ROUND(AVG(CAST(`Avg ratings` AS DECIMAL(10,2))), 2) AS avg_rating
FROM swiggy
GROUP BY City
ORDER BY avg_rating DESC;

#14.Restaurants with rating above 4
SELECT Restaurant, City, `Avg ratings`
FROM swiggy
WHERE `Avg ratings` > 4
ORDER BY `Avg ratings` DESC;

#4.Delivery Time Analysis
#15.Average Delivery Time by city
SELECT City,
ROUND(AVG(`Delivery time`), 2) AS avg_delivery_time
from swiggy
group by City
ORDER BY avg_delivery_time;

#16.Restaurants with delivery time under 30 minutes
Select Restaurant, City, `Delivery time`
from swiggy
where `Delivery time` < 30
order by `Delivery time`;

#17.Top 10 fastest delivery restaurants
select Restaurant, City, `Delivery time`
from swiggy
order by `Delivery time` ASC
LIMIT 10;

#5.Price Category Analysis
#18.Categorize resaturants by Price
Select
case
when Price < 300 THEN 'Budget'
when Price BETWEEN 300 AND 600 THEN 'Mid-range'
else 'Premium'
end as price_category,
COUNT(*) as total_restaurants
from  swiggy
Group by price_category;

#19.Restaurants with more than 1,000 ratings 
select Restaurant, City, `Total ratings`
from swiggy
where `Total ratings` > 1000
order by `Total ratings` desc;