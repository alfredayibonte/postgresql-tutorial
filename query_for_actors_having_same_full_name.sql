-- find count of actors and find count of unique actors having same name --
-- actor count is 200 and unique actor count is 199. ----
--- this question is to help you find that one actor that is repeating ---

SELECT first_name,last_name,
COUNT(*)
FROM actor
GROUP BY first_name, last_name
HAVING COUNT(*) >1;


-- alternative solution will be to join the distinct fullname table with the actor table and find row where actor_id isn't equal but full names are the same --

SELECT DISTINCT ac.first_name, ac.last_name
FROM actor AS ac JOIN actor
USING(first_name, last_name)
WHERE ac.actor_id != actor.actor_id AND ac.first_name = actor.first_name AND ac.last_name = actor.last_name;
