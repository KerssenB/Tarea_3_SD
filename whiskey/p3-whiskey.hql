USE datasets;

SELECT branch_type, taken, COUNT(*) AS taken_count
FROM whiskey
GROUP BY branch_type, taken;