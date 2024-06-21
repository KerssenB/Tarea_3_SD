data = LOAD 'hdfs://localhost:9000/user/hadoop/input/merced_trace-1_13378400607429273214.branch_trace.467769.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

total_records = FOREACH (GROUP data ALL) GENERATE COUNT(data);
STORE total_records INTO 'hdfs://localhost:9000/user/hadoop/merced-total_records' USING PigStorage(',');