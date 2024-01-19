-- IST ASSIGNMENT ON SQL

use mavenmovies;

-- qus1. Identify the primary and foreign keys in mavenmovies database .Disscuss the differences.
                                          -- IDENTIFY PRIMARY KEY IN MAVENMOVIES DATABASE
show databases;
use mavenmovies;                          -- HERE COLUMN NAME REPRESENT THE PRIMARY KEY                
select table_schema , table_name , column_name , data_type from information_schema.columns where table_schema='mavenmovies'
                                                                                 and column_key ='PRI' order by table_name;   -- primary key for all tables.
show keys from mavenmovies.film where key_name='PRIMARY';                                                                     -- primary key for film table here.            

                                          -- IDENTIFY THE FOREIGN KEY
select RefCons.constraint_schema,RefCons.table_name,RefCons.referenced_table_name,RefCons.constraint_name,KeyCol.column_name 
                                         from information_schema.referential_constraints RefCons
                                         join information_schema.key_column_usage keyCol
                                         on RefCons.constraint_schema=Keycol.table_schema
                                         and RefCons.table_name=KeyCol.table_name
                                         and RefCons.constraint_name=KeyCol.constraint_name
                                         where RefCons.constraint_schema='mavenmovies' ;             -- HERE COLUMN NAME REPRESENT THE FOREIGN KEY.
                                         
show create table mavenmovies.film;                                          
                                          -- DIFFERENCES BETWEEN PRIMARY KEY AND FOREIGN KEY
                                          
-- 1.PRIMARY_KEY :- A PRIMARY KEY IS A UNIQUE IDENTIFIER FOR EACH RECORD IN A TABLE.
-- PRIMARY KEY NOT ACCEPT NULL VALUE.
-- ONLY ONE PRIMARY KEY IN A TABLE.
                                          
-- 2.FOREIGN_KEY :- A FOREIGN KEY ESTABLISHES A RELATIONSHIP BETWEEN TABLES BY REFERENCING THE PRIMARY KEY OF ANOTHER TABLE. 
-- FOREIGN KEY CAN ACCEPT MULTIPLE NULL VALUES.  
-- MORE THAN ONE FOREIGN KEY IN A TABLE.     
                                  
-- qus2. List of all details of actors.
select * from actor;

-- qus3. List of all customer information from database.
select * from customer;

-- qus4. List different countries.
select distinct(country) from country;

-- qus5. Display all active customer.
select last_name , first_name ,active from customer where active=1;

-- qus6. List of all rental ID for customer with ID1.
select rental_id ,customer_id from rental where customer_id=1;

-- qus7. Display all the films whose rental duration is greater than 5.
select title, rental_duration from film where rental_duration>5;

-- qus8. List the total no. of films whose replacement cost is greater than 15 and less than 20.
select COUNT(title)  from film where replacement_cost between 15 and 20;

-- qus9. Display the count of unique first name of actor.
select count(distinct(first_name)) from actor;

-- qus10. Display the first 10 records from the customer table.
select * from customer limit 10;

-- qus11. Display the first 3 records from the customer table whose first name start with b.
select first_name from customer where first_name like "B%" limit 3;	

-- qus12. Display the names of first 5 movies which are rated as G.
select title ,rating  from film where rating like "G" limit 5;

-- qus13. Find all customer whose first_name starts with A.
select first_name from customer where first_name like "A%";

-- qus 14. Find all customer whose first name ends with a.
select first_name from customer where first_name like "%a";

-- qus15. Display the list first 4 cities which starts and end with a.
select city from city where city like "a%a" limit 4;

-- qus16. Find all customer whose first name have "ni" in any position.
select first_name from customer where first_name like "%ni%";

-- qus17. Find all customer whose first_name have r in second position.
select first_name from customer where first_name like "_r%";

-- qus18. Find all customer whose first name start with a and are atleast 5 character in length.
select first_name from customer where length(first_name ) >=5 and first_name like "a%";

-- qus19. Find all customer whose first_name starts with a and ends with o.
select  first_name from customer where first_name like "a%e";

-- qus20. Get the films with PG and PG-13 rating using IN operator.
select title , rating from film where rating ="pG" or rating= "pg-13"; -- using by or operator
select title , rating from film where rating in("pg","pg-13");         -- using by in operator

-- qus21. Get the films with length between 50 and 100 using between operator.
select title  ,length from film where length between 50 and 100;

-- qus22. Get the top 50 actors using limit operator.
select first_name , last_name from actor limit 50;

-- qus23. Get the distnict film id from inventory table.
select distinct(film_id) from inventory;