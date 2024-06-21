data = LOAD 'hdfs://localhost:9000/user/hadoop/input/whiskey_trace-1_1748052322638680856.branch_trace.426708.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_taken_ratio = FOREACH (GROUP data BY branch_type) {
    taken_1_count = FILTER data BY taken == 1;
    total_count = COUNT(data);
    proportion = (double)COUNT(taken_1_count) / (double)total_count;
    GENERATE group AS branch_type, proportion AS taken_1_proportion;
};
STORE branch_taken_ratio INTO 'hdfs://localhost:9000/user/hadoop/whiskey-branch_taken_ratio' USING PigStorage(',');
