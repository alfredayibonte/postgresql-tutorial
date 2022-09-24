--- first which tables are involved? customers & payment. we check customer table but doesn't have amount, we check paymenet table and yes! ---
--- payment table has amounts ---
--- now question is; how do we get the total amount by each customer in the payment table ---

SELECT SUM(amount), customer_id AS total_payment FROM payment GROUP BY customer_id;

--- Next question is how do we get the highes from this. ----
--- one way is to arrange them and put the highest on top ----
---- next question: how do you arrange them. have to order by? ---

SELECT SUM(amount) AS total_payment, customer_id FROM payment GROUP BY customer_id ORDER BY total_payment DESC;

---- clearly it's the one on top. Question: how do you get the one on top. LIMIT? ----
---- took 77 - 127 msec ----
SELECT SUM(amount) AS total_payment, customer_id FROM payment GROUP BY customer_id ORDER BY total_payment DESC LIMIT 1;


--- next question is how do I get the customers  name and email ---
SELECT SUM(amount) AS total_payment, payment.customer_id, customer.email, customer.first_name, customer.last_name FROM payment INNER JOIN customer USING(customer_id) GROUP BY (payment.customer_id, customer.first_name, customer.last_name, customer.email) ORDER BY total_payment DESC LIMIT 1;

SELECT * FROM customer WHERE customer.customer_id IN (
SELECT customer_id  FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 1);
