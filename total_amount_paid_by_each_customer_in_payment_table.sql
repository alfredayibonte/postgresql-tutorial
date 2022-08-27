SELECT SUM(amount), customer_id, first_name, last_name
FROM payment INNER JOIN customer USING(customer_id) GROUP BY customer_id;