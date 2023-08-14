# Write your MySQL query statement below
SELECT DISTINCT a.author_id AS id
FROM Views v
JOIN (
    SELECT article_id, author_id
    FROM Views
    WHERE author_id = viewer_id
) a ON v.article_id = a.article_id AND v.viewer_id = a.author_id
ORDER BY a.author_id asc;