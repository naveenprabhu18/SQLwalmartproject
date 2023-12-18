create database if not exists walmartsalesdata;
use walmartsalesdata;
create table sales(
invoice_id varchar(30) Not null primary Key,
branch  varchar(5) Not null,
city varchar(30) not null,
customer_type varchar(30) not null,
gender varchar(10) not null,
product_line varchar(110) not null,
unit_price  Decimal(10,2) not null,
quantity int not null,
VAT float(6,4) not null,
total Decimal(12,4) not null,
date DATETIME not null,
time TIME not null,
payment_method varchar(15) not null,
cogs DECIMAL(10,2) not null,
gross_margin_pct float(11,9),
gross_income decimal(12,4) not null,
rating float(2,1)
);
 select * from sales;
 select time from sales;
SELECT
 time,
(CASE 
    WHEN time BETWEEN "00:00:00" AND "12:00:00"  THEN "morning"
	WHEN time BETWEEN "12:01:00" AND "16:00:00"  THEN "noon"
	else "Evening"
END ) AS time_and_date
 from sales;
select city as oor,count(city) from sales group by city;
select branch as house,count(branch) from sales group by branch;
alter table sales add column  time_of_day varchar(20)after date ;
update sales set time_of_day=( case
when 'time' between "00:00:00" and "12:00:00" then "Morning"
WHEN time BETWEEN "12:01:00" AND "16:00:00"  THEN "noon"
	else "Evening"
    End);
    select date, dayname(date) as days from sales;
    
    alter table sales add column day varchar(30) after date;
    update sales set day=dayname(date) ;
    
    select date ,monthname(date) from sales;
    alter table sales add column month varchar(20) after date;
    update sales set month=monthname(date);
    select month as total,count(month) from sales group by month;
    
    select  distinct city from sales  ;
    
    select distinct city,month from sales;
    -- DIStinct product list count
    select count( distinct product_line )as total from sales;
    
    -- most comman payment method
    select payment_method ,count(payment_method)as cnn from  sales group by payment_method  order by cnn desc ;
    
   -- most selling product line
   select  product_line ,count(product_line)  as total from sales group by product_line order by total asc ;
   
   -- total revenue by month
   select month ,sum(total) from sales group by (month);
   
   -- month has largest cogs
   select * from sales;
   select month ,sum(cogs) from sales group by(month) ; 
   
   -- what product line has largest revenue
   select product_line ,sum(total)as alls from sales group by product_line order by alls desc;
   
   -- city with largest revenue
   select branch,city,sum(total) as alls from sales group by branch ,city order by alls desc ;
   
   
   -- what product line has largest vat
   select product_line,avg(vat) from sales group by product_line;
   
   
   alter table sales add column grade varchar(10) after product_line;
   
   update sales set grade=(case  
   when vat<10 and vat>0 then "bad"
   when vat<20 and vat>10 then "good"
   else "very good"
   end);
   
    -- which branch sold more products than average product sold
    select branch,sum(quantity) from sales group by branch
    having sum(quantity)> (select avg(quantity)from sales);
    
    -- common product line by gender
    select gender,product_line,count(gender) from sales group by gender,product_line;
    
    -- avg rating of each productline
    select product_line ,avg(rating)as alls from sales group by product_line order by alls desc;
    
    
    --  SALES -----------------------
    -- no of sales made in each time of the day per weekday

select * from sales;
select time_of_day ,count(*) from sales group by time_of_day;
    
    
    