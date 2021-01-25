use sakila;
# Select all the actors with the first name ‘Scarlett’.
# How many films (movies) are available for rent and how many films have been rented?
# What are the shortest and longest movie duration? Name the values max_duration and min_duration.
# What's the average movie duration expressed in format (hours, minutes)?
# How many distinct (different) actors' last names are there?
# Since how many days has the company been operating (check DATEDIFF() function)?
# Show rental info with additional columns month and weekday. Get 20 results.
# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
# How many rentals were in the last month of activity?

# 1 Select all the actors with the first name ‘Scarlett’.
select * from actor
WHERE first_name = "Scarlett";

# 2. How many films (movies) are available for rent and how many films have been rented?
# films available
select count(inventory_id) from inventory;

# films that have been rented
select count(*) from rental
where isnull(return_date);

# 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as min_duration, max(length) as max_duration from film;

# 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT floor(avg(length)/ 60) as avg_length_hours, floor(avg(length) - 60) as avg_length_minutes from film;


# 5. How many distinct (different) actors' last names are there?

select count(distinct last_name) from actor;


# 6. Since how many days has the company been operating (check DATEDIFF() function)?

select DATEDIFF('2006/02/15', CURDATE()) AS days;

# 7. Show rental info with additional columns month and weekday. Get 20 results.

select *, date_format(convert(rental_date,date), "%M" ) as "Rental_date_month", 
date_format(convert(rental_date,date), "%W" ) as "Rental_date_weekday"
from rental
limit 20;
 
# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, case    	
   when date_format(rental_date, '%a') in ('Mon', 'Tue', 'Wed', 'Thu', 'Fri') then 'workday'
   when date_format(rental_date, '%a') in ('Sat', 'Sun') then 'weekend'
end as week_day
from rental;
