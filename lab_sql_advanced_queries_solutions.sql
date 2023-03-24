# Lab | SQL Advanced queries
USE sakila;

### 1. List each pair of actors that have worked together.
SELECT fa1.actor_id as actor_1,fa2.film_id,fa2.actor_id as actor_2, f.title
FROM film_actor fa1
JOIN film_actor fa2
ON fa1.film_id = fa2.film_id
JOIN film f
ON fa1.film_id = f.film_id
WHERE fa1.actor_id != fa2.actor_id AND fa1.film_id = fa2.film_id
ORDER BY fa1.film_id;

### 2. For each film, list actor that has acted in more films.
-- Which actor has appeared in the most films?
SELECT f.title,fa.actor_id
FROM film f
JOIN film_actor fa
USING (film_id)
GROUP BY film_id
ORDER BY fa.actor_id IN (SELECT * 
						 FROM (SELECT actor_id 
							   FROM film_actor 
                               GROUP BY actor_id 
                               ORDER BY count(film_id) DESC 
                               LIMIT 1 ) AS t);