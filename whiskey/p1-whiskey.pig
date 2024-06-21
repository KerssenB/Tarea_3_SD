data = LOAD 'hdfs://localhost:9000/user/hadoop/input/whiskey_trace-1_1748052322638680856.branch_trace.426708.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

total_records = FOREACH (GROUP data ALL) GENERATE COUNT(data);
STORE total_records INTO 'hdfs://localhost:9000/user/hadoop/whiskey-total_records' USING PigStorage(',');