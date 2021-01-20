# 1. Review the tables in the database.
show tables;

# 2. Explore tables by selecting all columns from each table or using the in built review features for your client.
# Right click on sakila -> schema inspector -> columns

# 3. Select one column from a table. Get film titles.
select title as filmtitle from film;

# 4. Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select distinct name as languages from language;

# 5. Using the select statements and reviewing how many records are returned, can you find out how many stores and staff does the company have? Can you return a list of employee first names only?

select count(return_date) from rental;
select count(store_id) from store;
select count(staff_name) from store;

select distinct first_name from staff;

select distinct rental;

# Bonus: How many unique days did customers rent movies in this dataset?

select count(distinct rental_date)
FROM rental;



