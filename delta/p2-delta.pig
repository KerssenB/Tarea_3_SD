data = LOAD 'hdfs://localhost:9000/user/hadoop/input/delta_trace-1_10058381926338669845.branch_trace.507251.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_counts = FOREACH (GROUP data BY branch_type) GENERATE group AS branch_type, COUNT(data) AS count;
STORE branch_counts INTO 'hdfs://localhost:9000/user/hadoop/delta-branch_counts' USING PigStorage(',');