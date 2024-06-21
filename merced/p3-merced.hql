USE datasets;

SELECT branch_type, taken, COUNT(*) AS taken_count
FROM merced
GROUP BY branch_type, taken;