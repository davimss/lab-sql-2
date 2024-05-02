-- Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM SAKILA.ACTOR
WHERE FIRST_NAME = 'Scarlett';

-- Select all the actors with the last name ‘Johansson’.
SELECT * 
FROM SAKILA.ACTOR
WHERE LAST_NAME = 'Johansson';

-- How many films (movies) are available for rent?
SELECT COUNT(INVENTORY_ID)
FROM SAKILA.INVENTORY;

-- How many films have been rented?
SELECT DISTINCT I.FILM_ID
FROM INVENTORY i
LEFT JOIN RENTAL r 
ON i.INVENTORY_ID = r.INVENTORY_ID
WHERE r.RETURN_DATE IS NOT NULL;

-- How many films have been rented?
SELECT *
FROM FILM WHERE FILM_ID IN
(SELECT DISTINCT FILM_ID
FROM SAKILA.INVENTORY WHERE INVENTORY_ID
NOT IN (SELECT DISTINCT INVENTORY_ID
FROM SAKILA.RENTAL WHERE RETURN_DATE IS NULL));

SELECT COUNT(RENTAL.INVENTORY_ID) TOTAL_ALQUILERES
FROM SAKILA.RENTAL;

-- What is the shortest and longest rental period?

-- Shortest:
SELECT MIN(RENTAL_DURATION) MIN_RENTAL
FROM FILM;

-- Longest:
SELECT MAX(RENTAL_DURATION) MAX_RENTAL
FROM SAKILA.FILM;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.

-- Longest:
SELECT MAX(LENGTH) MAX_DURATION
FROM SAKILA.FILM;

-- Shortest:
SELECT MIN(LENGTH) MIN_DURATION
FROM SAKILA.FILM;

-- What's the average movie duration?
SELECT AVG(LENGTH) AVG_DURATION
FROM SAKILA.FILM;

-- 8. What's the average movie duration expressed in format (hours, minutes)?
SELECT 
TRUNCATE(AVG(LENGTH) / 60, 0) AS hours,
TRUNCATE(AVG(LENGTH) % 60, 0) AS minutes
FROM SAKILA.FILM;
    
-- How many movies longer than 3 hours?
SELECT COUNT(FILM_ID) longer_3
FROM SAKILA.FILM
WHERE LENGTH > 180;


-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT CONCAT(first_name, ' ', UPPER(last_name), ' - ',
LOWER(CONCAT(first_name, '.', last_name, '@sakilacustomer.org'))) AS formatted_name_email
FROM SAKILA.CUSTOMER;

-- What's the length of the longest film title?
SELECT TITLE, LENGTH, LENGTH(TITLE),
RANK() OVER(ORDER BY LENGTH(TITLE) DESC) RANKING
FROM SAKILA.FILM
LIMIT 1;
