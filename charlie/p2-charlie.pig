data = LOAD 'hdfs://localhost:9000/user/hadoop/input/charlie_trace-1_17571657100049929577.branch_trace.1006511.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_counts = FOREACH (GROUP data BY branch_type) GENERATE group AS branch_type, COUNT(data) AS count;
STORE branch_counts INTO 'hdfs://localhost:9000/user/hadoop/charlie-branch_counts' USING PigStorage(',');