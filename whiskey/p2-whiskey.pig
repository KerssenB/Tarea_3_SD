data = LOAD 'hdfs://localhost:9000/user/hadoop/input/whiskey_trace-1_1748052322638680856.branch_trace.426708.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_counts = FOREACH (GROUP data BY branch_type) GENERATE group AS branch_type, COUNT(data) AS count;
STORE branch_counts INTO 'hdfs://localhost:9000/user/hadoop/whiskey-branch_counts' USING PigStorage(',');