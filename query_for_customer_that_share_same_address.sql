-- we start by select count of address_id in customer table which is 599 --
-- select count of distinct address_id in customer table which is also 599 meaning there's no customer with same address --

--- if there were repeating addresses, we can use the query below as solution ---

SELECT * FROM customer WHERE address_id IN (
	SELECT address_id FROM customer GROUP BY address_id HAVING COUNT(address_id) > 1
);


--- alternative solution ---
SELECT cc.customer_id, cc.first_name, cc.last_name, cc.address_id FROM customer AS cc JOIN customer USING(customer_id) WHERE
 cc.address_id = customer.address_id AND cc.customer_id != customer.customer_id;