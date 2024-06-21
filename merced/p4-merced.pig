data = LOAD 'hdfs://localhost:9000/user/hadoop/input/merced_trace-1_13378400607429273214.branch_trace.467769.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_taken_ratio = FOREACH (GROUP data BY branch_type) {
    taken_1_count = FILTER data BY taken == 1;
    total_count = COUNT(data);
    proportion = (double)COUNT(taken_1_count) / (double)total_count;
    GENERATE group AS branch_type, proportion AS taken_1_proportion;
};
STORE branch_taken_ratio INTO 'hdfs://localhost:9000/user/hadoop/merced-branch_taken_ratio' USING PigStorage(',');
