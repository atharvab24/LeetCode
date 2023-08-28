# Write your MySQL query statement below
SELECT
    us.product_id,
    ROUND(SUM(p.price * us.units) / SUM(us.units), 2) AS average_price
FROM UnitsSold us
JOIN Prices p ON us.product_id = p.product_id AND us.purchase_date >= p.start_date AND us.purchase_date <= p.end_date
GROUP BY us.product_id;