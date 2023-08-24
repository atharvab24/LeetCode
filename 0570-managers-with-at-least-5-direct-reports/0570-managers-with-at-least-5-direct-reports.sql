# Write your MySQL query statement below
SELECT m.name
FROM Employee m
JOIN (
    SELECT managerId, COUNT(id) AS reportCount
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(id) >= 5
) r ON m.id = r.managerId;