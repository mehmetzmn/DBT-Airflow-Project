WITH monthly_sales AS (
    SELECT * FROM {{ ref('monthly_sales_by_product') }}
),

products AS (
    SELECT * FROM {{ ref('products') }}
),

orders AS (
    SELECT * FROM {{ ref('orders') }}
)

SELECT
    products.product_category,
    monthly_sales.SalesMonth,
    SUM(monthly_sales.product_count) AS TotalOrderCount,
    SUM(monthly_sales.total_sales_amount) AS TotalSalesAmount
FROM monthly_sales
JOIN products ON monthly_sales.product_id = products.product_id
GROUP BY products.product_category, monthly_sales.SalesMonth