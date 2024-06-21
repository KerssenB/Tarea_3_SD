USE datasets;

SELECT branch_type, COUNT(*) AS count FROM whiskey GROUP BY branch_type;
