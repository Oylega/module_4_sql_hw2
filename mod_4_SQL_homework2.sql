--1. List all customers who live in Texas (use
--JOINs)
select customer.first_name, customer.last_name, district
from customer 
full join address
on customer.address_id = address.address_id
where district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full
--Name
select customer.first_name, customer.last_name, amount
from customer 
full join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99;


--3. Show all customers names who have made payments over $175(use
--subqueries)
select  customer_id, first_name, last_name
from customer where customer_id in(
	select customer_id
	from payment
	where amount > 175
	order by amount desc 
);

--4. List all customers that live in Nepal (use the city
--table)
select customer.first_name, customer.last_name, country
from customer 
full join address
on customer.address_id = address.address_id
full join city  
on address.city_id = city.city_id
full join country  
on city.country_id = country.country_id 
where country = 'Nepal';

--5. Which staff member had the most
--transactions?
select staff_id, count(staff_id)
from payment 
group by staff_id
order by count(staff_id) desc;

--6. How many movies of each rating are
--there?
select rating, count(rating)
from film 
group by rating 
order by count desc

--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)
select customer_id
from customer where customer_id in(
	select customer_id
	from payment 
	where amount > 6.99
	order by amount desc	
);

--8. How many free rentals did our stores give away?
select count(rental.rental_id)
from rental 
left join payment
on rental.rental_id = payment.rental_id
where amount is null;

-- 1452 free rentals
