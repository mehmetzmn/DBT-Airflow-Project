WITH orders AS (
    SELECT 
    product_id,
    order_date,
    EXTRACT(MONTH FROM order_date) as SalesMonth,
    total_amount
    FROM {{ ref('orders') }}
)

SELECT 
    SalesMonth,
    product_id,
    COUNT(product_id) AS product_count,
    SUM(total_amount) AS total_sales_amount
FROM orders
GROUP BY SalesMonth, product_id
ORDER BY SalesMonth
