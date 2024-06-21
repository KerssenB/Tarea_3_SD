USE datasets;

WITH total_counts AS (
    SELECT branch_type, COUNT(*) AS total_count
    FROM charlie
    GROUP BY branch_type
),
taken_counts AS (
    SELECT branch_type, COUNT(*) AS taken_1_count
    FROM charlie
    WHERE taken = 1
    GROUP BY branch_type
)
SELECT t.branch_type, (CAST(tc.taken_1_count AS DOUBLE) / CAST(t.total_count AS DOUBLE)) AS taken_1_proportion
FROM total_counts t
JOIN taken_counts tc
ON t.branch_type = tc.branch_type;