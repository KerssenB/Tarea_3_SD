data = LOAD 'hdfs://localhost:9000/user/hadoop/input/charlie_trace-1_17571657100049929577.branch_trace.1006511.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

total_records = FOREACH (GROUP data ALL) GENERATE COUNT(data);
STORE total_records INTO 'hdfs://localhost:9000/user/hadoop/charlie-total_records' USING PigStorage(',');