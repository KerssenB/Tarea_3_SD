USE datasets;

SELECT branch_type, COUNT(*) AS count FROM charlie GROUP BY branch_type;
