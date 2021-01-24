-- In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.
use sakila;

-- 1. Create a table rentals_may to store the data from rental table with information for the month of May.
	-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

DROP TABLE IF EXISTS rentals_may;

CREATE TABLE rentals_may AS
SELECT *
FROM rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-05-31';

select * from rentals_may;


-- 3. Create a table rentals_june to store the data from rental table with information for the month of June.
	-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

DROP TABLE IF EXISTS rentals_june;

CREATE TABLE rentals_june AS
SELECT *
FROM rental
WHERE rental_date BETWEEN '2005-06-01' AND '2005-06-30';

select * from rentals_may;

-- 5. Check the number of rentals for each customer for May.

SELECT r.customer_id, c.first_name, c.last_name, count(r.rental_id) AS nr_of_rentals
FROM rentals_may as r
join customer as c
on r.customer_id = c.customer_id
group by c.last_name
order by nr_of_rentals DESC;

-- simpler option:

-- select customer_id, count(rental_id) as nr_of_rentals
-- from rentals_may
-- group by customer_id
-- order by nr_of_rentals DESC;

-- 6. Check the number of rentals for each customer for June.

select customer_id, count(rental_id) as nr_of_rentals
from rentals_june
group by customer_id
order by nr_of_rentals DESC;
