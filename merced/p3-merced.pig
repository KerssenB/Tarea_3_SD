data = LOAD 'hdfs://localhost:9000/user/hadoop/input/merced_trace-1_13378400607429273214.branch_trace.467769.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_taken_analysis = FOREACH (GROUP data BY (branch_type, taken)) {
    taken_count = COUNT(data);
    GENERATE FLATTEN(group) AS (branch_type, taken), taken_count;
};
STORE branch_taken_analysis INTO 'hdfs://localhost:9000/user/hadoop/merced-branch_taken_analysis' USING PigStorage(',');