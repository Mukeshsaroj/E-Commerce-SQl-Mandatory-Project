-- 1.Create new schema as ecommerce
create database ecommerce;

-- 2.Import .csv file users_data into MySQL
-- Right click on tables of ecommerce database -> select table data import wizard -> browse path and select user_data and click on next -> and select finished
use ecommerce;

-- 3.Run SQL command to see the structure of table
describe users_data;

-- 4.Run SQL command to select first 100 rows of the database
select * from users_data limit 100;

-- 5.How many distinct values exist in table for field country and language
select count(distinct country) "country",count(distinct language) "Language" from users_data;


-- 6.Check whether male users are having maximum followers or female users
select * from users_data;
select gender,sum(socialnbfollowers) from users_data group by gender;


-- 7.Calculate the total users those

select * from users_data;
-- a. Uses Profile Picture in their Profile
select count(identifierhash) from users_data where hasprofilepicture='true';
-- b. Uses Application for Ecommerce platform
select count(identifierhash) from users_data where hasanyapp='True';
-- c. Uses Android app
select count(identifierhash) from users_data where hasandroidapp='True';
-- d .Uses ios app
select count(identifierhash) from users_data where hasiosapp='True';

-- 8.Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
select * from users_data;
select count(productsbought),country from users_data where productsbought!=0 group by country order by count(productsbought) desc;

-- 9.Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers.
select * from users_data;
select count(productssold),country from users_data where productssold>0  group by country order by count(productssold) asc;

-- 10.Display name of top 10 countries having maximum products pass rate.
select * from users_data;
select distinct country,productspassrate from users_data order by productspassrate desc limit 10;

-- 11.Calculate the number of users on an ecommerce platform for different language choices.
select * from users_data;
select count(language),language from users_data group by language;

-- 12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.
select * from users_data;
select count(gender),gender from users_data where gender="F" and (socialproductsliked>0 or productswished>0) ;

-- 13.Check the choice of male users about being seller or buyer.
select count(productssold) from users_data where gender = "m" and productssold!=0 union (select count(productsbought) from users_data where gender='m' and productsbought!=0);


-- 14.Which country is having maximum number of buyers?
select * from users_data;
select productsbought,country from users_data where productsbought=(select max(productsbought) from users_data);

-- 15.List the name of 10 countries having zero number of sellers
select country,productssold from users_data where productssold=0 group by country limit 10;

-- 16.Display record of top 110 users who have used ecommerce platform recently.
select * from users_data;
select * from users_data order by dayssincelastlogin limit 110;

-- 17.Calculate the number of female users those who have not logged in since last 100 days
select count(gender),gender from users_data where gender="f" and dayssincelastlogin>100;

-- 18.Display the number of female users of each country at ecommerce platform
select count(gender),country from users_data where gender='f' group by country;

-- 19.Display the number of male users of each country at ecommerce platform
select count(gender),country from users_data where gender='m' group by country;


-- 20.Calculate the average number of products sold and bought on ecommerce platform by male users for each country
select * from users_data;
select country,avg(productssold) sold,avg(productsbought) bought from users_data where gender="m" group by country;















