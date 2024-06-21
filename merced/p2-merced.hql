USE datasets;

SELECT branch_type, COUNT(*) AS count FROM merced GROUP BY branch_type;
