data = LOAD 'hdfs://localhost:9000/user/hadoop/input/whiskey_trace-1_1748052322638680856.branch_trace.426708.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_taken_analysis = FOREACH (GROUP data BY (branch_type, taken)) {
    taken_count = COUNT(data);
    GENERATE FLATTEN(group) AS (branch_type, taken), taken_count;
};
STORE branch_taken_analysis INTO 'hdfs://localhost:9000/user/hadoop/whiskey-branch_taken_analysis' USING PigStorage(',');