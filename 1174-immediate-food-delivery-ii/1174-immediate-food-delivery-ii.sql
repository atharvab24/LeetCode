# Write your MySQL query statement below
SELECT ROUND(
           (SUM(CASE WHEN D.order_date = D.customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*)) * 100,
           2
       ) AS immediate_percentage
  FROM (
           SELECT customer_id, MIN(order_date) AS first_order_date
             FROM Delivery
            GROUP BY customer_id
       ) AS first_orders
  JOIN Delivery AS D
    ON first_orders.customer_id = D.customer_id
   AND first_orders.first_order_date = D.order_date;