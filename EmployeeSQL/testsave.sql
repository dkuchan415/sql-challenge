SELECT * FROM film LIMIT 100;

SELECT COUNT(*) FROM film where release_year=2006;
SELECT * FROM film WHERE rating='PG';
SELECT film_id, title, description, release_year, rating FROM film WHERE rating='PG';
select count(*) from film where rating='PG';
SELECT COUNT(*) AS "PG films" from film where rating='PG';

select count(*) from actor;
select count(*) from rental;

select rating, count(*) from film group by rating order by count(*);

SELECT rental_rate, max(replacement_cost) FROM film group by rental_rate;

SELECT * FROM film;

--Average rental cost

SELECT round(avg(rental_rate),2) from film;

--Rental cost by rating

SELECT rating, round(avg(rental_rate),2) from film group by rating;

--Replace all films in database

SELECT sum(replacement_cost) from film;

--Total replacement cost by rating

SELECT rating, sum(replacement_cost) from film group by rating;

--Max and min film lengths

SELECT max(length) from film;

SELECT min(length) from film;

SELECT rental_rate, ROUND(AVG(length), 2) AS "avg length"
FROM film
GROUP BY rental_rate
ORDER BY "avg length" DESC;


-- Count of actor first names in desc order

SELECT first_name, count(first_name) FROM actor 
group by first_name
ORDER BY first_name DESC;

--Determine avg rental duration

SELECT rating, round(avg(rental_duration),2) AS "Avg Rental Duration" FROM film
	GROUP BY rating
	ORDER BY "Avg Rental Duration";
	
--Determine top 10 avg replace costs

SELECT length, round(avg(replacement_cost),2) AS "Avg Replace Cost" FROM film
	GROUP BY length
	ORDER BY "Avg Replace Cost" DESC;

SELECT * FROM city;

--List city name and id

SELECT city_id, city FROM city
	WHERE city in ('Qalyub', 'Qinhuangdao', 'Qomsheh', 'Quilmes');
	
-- Display districts from city list above
SELECT * FROM address;

SELECT city_id, district FROM address
	WHERE city_id in
	(SELECT city_id 
	 FROM city
	 WHERE city in ('Qalyub', 'Qinhuangdao', 'Qomsheh', 'Quilmes')
);

--Bonus = find first and last name of customers in Q cities

SELECT city_id FROM city
	WHERE city like (Q%);