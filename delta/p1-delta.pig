data = LOAD 'hdfs://localhost:9000/user/hadoop/input/delta_trace-1_10058381926338669845.branch_trace.507251.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

total_records = FOREACH (GROUP data ALL) GENERATE COUNT(data);
STORE total_records INTO 'hdfs://localhost:9000/user/hadoop/delta-total_records' USING PigStorage(',');