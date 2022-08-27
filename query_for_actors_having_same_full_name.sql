-- find count of actors and find count of unique actors having same name --
-- actor count is 200 and unique actor count is 199. ----
--- this question is to help you find that one actor that is repeating ---

SELECT first_name,last_name,
COUNT(*)
FROM actor
GROUP BY first_name, last_name
HAVING COUNT(*) >1;
