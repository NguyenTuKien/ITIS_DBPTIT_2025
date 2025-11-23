SELECT DISTINCT size
FROM customers_us_mx
WHERE country = 'USA'
INTERSECT
SELECT DISTINCT size
FROM customers_us_mx
WHERE country = 'Mexico'