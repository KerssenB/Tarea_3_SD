USE datasets;

SELECT branch_type, COUNT(*) AS count FROM delta GROUP BY branch_type;
