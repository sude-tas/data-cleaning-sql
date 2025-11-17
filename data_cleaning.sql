-- Remove duplicate rows based on customer_id
DELETE FROM customers
WHERE id NOT IN (
    SELECT MIN(id)
    FROM customers
    GROUP BY customer_id
);

-- Find NULL values
SELECT *
FROM orders
WHERE order_date IS NULL
   OR customer_id IS NULL;

-- Fix incorrect data types
ALTER TABLE orders
ALTER COLUMN order_date TYPE DATE
USING order_date::DATE;
