use sakilla;

-- 1. Get release years.

select distinct(release_year) from film;


-- 2. Get all films with ARMAGEDDON in the title.

select * from film
where title like "%Armageddon%";


-- 3. Get all films which title ends with APOLLO.

select * from film
where title like "%APOLLO";


-- 4. Get 10 the longest films.

select * from film
order by length desc
limit 10;


-- 5. How many films include Behind the Scenes content?

select count(film_id) from film
where special_features like "%Behind the scenes%";


-- 6. Drop column picture from staff.

alter table staff
drop column picture;


-- 7. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select * from customer
where first_name like "%Tammy"; # to copy info

insert into staff
values ('3', 'TAMMY', 'SANDERS', '79', 'TAMMY.SANDERS@sakilacustomer.org', '1', '1', 'Tammy', ' ', '2006-02-15 04:57:20' );

-- 8. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. 
-- For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
-- select customer_id from sakila.customer
-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';


select customer_id from sakila.customer
where first_name = "CHARLOTTE" and last_name = "HUNTER";

select * from rental
order by rental_id desc
limit 3;

select * from staff
where first_name= "MIKE" and last_name= "HILLYER";

select film_id from film where title= "ACADEMY DINOSAUR";

select * from inventory
where film_id=1;

insert into rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values(16050, "2021-01-20 16:57:22", 1,130, NULL, 1, "2021-01-20 21:43:28");

select* from rental
where rental_id=16050;


-- 10. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

alter table payment add CONSTRAINT `f_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;
alter table rental add CONSTRAINT `f_rental_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;

select customer_id, email, active
from customer
where active = 0;

drop table if exists deleted_users;

create table deleted_users ( customer_id int(11) unique not null,
    email varchar(50) default null,
    date int(11)); 

alter table deleted_users
modify date date;

insert into deleted_users (customer_id,email, date)
values
(16,'SANDRA.MARTIN@sakilacustomer.org','2021-01-20'), 
(64,'JUDITH.COX@sakilacustomer.org','2021-01-20'), 
(124,'SHEILA.WELLS@sakilacustomer.org','2021-01-20'), 
(169,'ERICA.MATTHEWS@sakilacustomer.org','2021-01-20'), 
(241,'HEIDI.LARSON@sakilacustomer.org','2021-01-20'),
(271,'PENNY.NEAL@sakilacustomer.org','2021-01-20'),
(315,'KENNETH.GOODEN@sakilacustomer.org','2021-01-20'),
(368,'HARRY.ARCE@sakilacustomer.org','2021-01-20'),
(406,'NATHAN.RUNYON@sakilacustomer.org','2021-01-20'),
(446,'THEODORE.CULP@sakilacustomer.org','2021-01-20'),
(482,'MAURICE.CRAWLEY@sakilacustomer.org','2021-01-20'),
(510,'BEN.EASTER@sakilacustomer.org','2021-01-20'),
(534,'CHRISTIAN.JUNG@sakilacustomer.org','2021-01-20'),
(558,'JIMMIE.EGGLESTON@sakilacustomer.org','2021-01-20'),
(592,'TERRANCE.ROUSH@sakilacustomer.org','2021-01-20');

select * from deleted_users;

select customer_id, active from customer
where active = 0;

delete from customer 
where (customer_id) in (16, 64, 124, 169, 241, 271, 315, 368, 406, 446, 482, 510, 534, 558, 592);



