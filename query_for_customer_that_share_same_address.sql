-- question can be reduced to finding customers with same address id ---
-- first view customer table to see if you have the need field for selection ---
-- we start by select count of address_id in customer table which is 599 --
-- select count of distinct address_id in customer table which is also 599 meaning there's no customer with same address --

--- if there were repeating addresses, we can use the query below as solution ---

--- this is a very bad query took 155msec to excute ---
SELECT * FROM customer WHERE address_id IN (
	SELECT address_id FROM customer GROUP BY address_id HAVING COUNT(address_id) > 1
);


--- Best solution alternative solution 36 msec to excute ---
SELECT cc.customer_id, cc.first_name, cc.last_name, cc.address_id FROM customer AS cc JOIN customer USING(address_id) WHERE
 cc.address_id = customer.address_id AND cc.customer_id != customer.customer_id;

-- After inner joining with the address table to get the address names in addition we have less time 33 - 42 msec---
SELECT * FROM customer AS cc INNER JOIN customer USING(address_id) INNER JOIN address USING(address_id) WHERE  cc.customer_id != customer.customer_id;