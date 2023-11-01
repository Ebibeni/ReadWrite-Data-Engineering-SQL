SELECT
AVG(customers.age) AS Average_Age
FROM purchases JOIN customers ON purchases.customer_id = customers.customer_id
WHERE YEAR (purchases.PURCHASE_DATE) = 2020 AND 
MONTH (purchases.PURCHASE_DATE) = 03
;
