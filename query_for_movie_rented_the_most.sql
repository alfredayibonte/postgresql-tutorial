--- which tables are involved? ---

--- find table that will give you most rented film. clearly it's the rental table---
--- select the count of the number of times a film is rented from the rental table but rental table doesn't have film_id how do you get the film id for your computation ---
--- You need to join it to inventory table to be able to get film ids----
SELECT COUNT(inventory.film_id) as freq, inventory.film_id FROM rental INNER JOIN inventory USING(inventory_id) GROUP BY inventory.film_id;

--- to get most rented you have to order them  in desc order----
SELECT COUNT(inventory.film_id) as freq, inventory.film_id FROM rental INNER JOIN inventory USING(inventory_id) GROUP BY inventory.film_id ORDER BY freq DESC;

--- to get the first item on top limit by 1----
SELECT COUNT(inventory.film_id) as freq, inventory.film_id FROM rental INNER JOIN inventory USING(inventory_id) GROUP BY inventory.film_id ORDER BY freq DESC LIMIT 1;

-- if you want to get the title of the movie inner join again but on film table using the common field film_id ----
SELECT COUNT(inventory.film_id) AS freq, inventory.film_id, film.title FROM rental INNER JOIN inventory USING(inventory_id) INNER JOIN film USING(film_id) GROUP BY inventory.film_id, film.title ORDER BY freq DESC LIMIT 1;


--- Assignment ----
--- we limited by 1 because we saw in the data 34 was the highest. What if we had two 34's, how can we get all movies with the highest frequency if two movies have the same frequency and they are the highest.----