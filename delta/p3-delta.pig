data = LOAD 'hdfs://localhost:9000/user/hadoop/input/delta_trace-1_10058381926338669845.branch_trace.507251.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_taken_analysis = FOREACH (GROUP data BY (branch_type, taken)) {
    taken_count = COUNT(data);
    GENERATE FLATTEN(group) AS (branch_type, taken), taken_count;
};
STORE branch_taken_analysis INTO 'hdfs://localhost:9000/user/hadoop/delta-branch_taken_analysis' USING PigStorage(',');