## Q1> Products Sales per City

--Solution

SELECT invoice.city_name,
product.product_name,
invoice_item.line_total_price
FROM invoice_item as invoice_item
JOIN product as product
ON invoice_item.product_id = product.id
JOIN (
    SELECT invoice.id,
    customer.city_name
    FROM invoice as invoice
    JOIN (
    SELECT customer.id,city.city_name
        FROM customer as customer
        LEFT JOIN city as city
        ON customer.city_id = city.id
    )as customer
    ON invoice.customer_id = customer.id
) as invoice
ON invoice_item.invoice_id = invoice.id
ORDER BY invoice_item.line_total_price DESC;

## Q2> Customer Spending

--Solution

SELECT
     c.customer_name, ROUND(SUM(i.total_price), 6)
FROM 
     customer c
INNER JOIN
     invoice i ON c.id=i.customer_id
GROUP BY
     c.customer_name
HAVING 
     SUM(i.total_price)<0.25*(SELECT AVG(total_price) FROM invoice)
ORDER BY
      ROUND(SUM(i.total_price), 6) DESC;
