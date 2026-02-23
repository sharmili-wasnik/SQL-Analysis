-- Rank Products by Revenue
SELECT
    p.product_name,
    SUM(p.price * oi.quantity) AS revenue,
    RANK() OVER (ORDER BY SUM(p.price * oi.quantity) DESC) AS revenue_rank
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- Running Total Revenue by Date
SELECT
    o.order_date,
    SUM(p.price * oi.quantity) AS daily_revenue,
    SUM(SUM(p.price * oi.quantity)) 
        OVER (ORDER BY o.order_date) AS running_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_date
ORDER BY o.order_date;
