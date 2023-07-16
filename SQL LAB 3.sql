-- 1. List the number of films per category.
SELECT category_id as category , count(1) AS Nb_film
FROM FILM_CATEGORY 
GROUP BY category_id;


-- 2. Retrieve the store ID, city, and country for each store.
SELECT store_id, city.city, country.country
FROM STORE 
JOIN ADDRESS ON store.ADDRESS_ID = address.ADDRESS_ID
JOIN CITY ON address.CITY_ID = CITY.CITY_ID
JOIN COUNTRY ON CITY.COUNTRY_ID = COUNTRY.COUNTRY_ID;

-- 3.  Calculate the total revenue generated by each store in dollars.
SELECT STORE_ID, sum(payment.amount) as Total_revenue
FROM staff
JOIN PAYMENT on staff.staff_id = payment.staff_id
group by store_id;


-- 4.  Determine the average running time of films for each category.
SELECT category_id, avg(film.length)
FROM film_category
JOIN film on film_category.film_id = film.film_id
group by category_id;

-- 5.  Identify the film categories with the longest average running time.
SELECT category_id, avg(film.length)
FROM film_category
JOIN film on film_category.film_id = film.film_id
group by category_id
Order by avg(film.length) desc limit 1 ;
-- 6.  Display the top 10 most frequently rented movies in descending order.
SELECT title, count(rental.rental_id)
FROM film
JOIN inventory on film.film_id = inventory.film_id
JOIN rental on inventory.inventory_id = rental.inventory_id
group by title
Order by count(rental.rental_id)  desc limit 10 ;
-- 7. Determine if "Academy Dinosaur" can be rented from Store 1.
SELECT title, store.store_id
FROM film
JOIN inventory on film.film_id = inventory.film_id
JOIN store on inventory.store_id = store.store_id
where title like "Academy Dinosaur"