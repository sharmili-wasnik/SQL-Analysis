-- Remove duplicate customers based on email
DELETE FROM customers
WHERE customer_id NOT IN (
    SELECT MIN(customer_id)
    FROM customers
    GROUP BY email
);

-- Handle missing city values
UPDATE customers
SET city = 'Unknown'
WHERE city IS NULL;

-- Remove cancelled orders
DELETE FROM orders
WHERE status = 'Cancelled';
