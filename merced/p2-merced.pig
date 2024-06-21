data = LOAD 'hdfs://localhost:9000/user/hadoop/input/merced_trace-1_13378400607429273214.branch_trace.467769.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_counts = FOREACH (GROUP data BY branch_type) GENERATE group AS branch_type, COUNT(data) AS count;
STORE branch_counts INTO 'hdfs://localhost:9000/user/hadoop/merced-branch_counts' USING PigStorage(',');