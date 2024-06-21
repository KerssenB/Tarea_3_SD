data = LOAD 'hdfs://localhost:9000/user/hadoop/input/charlie_trace-1_17571657100049929577.branch_trace.1006511.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

branch_taken_ratio = FOREACH (GROUP data BY branch_type) {
    taken_1_count = FILTER data BY taken == 1;
    total_count = COUNT(data);
    proportion = (double)COUNT(taken_1_count) / (double)total_count;
    GENERATE group AS branch_type, proportion AS taken_1_proportion;
};
STORE branch_taken_ratio INTO 'hdfs://localhost:9000/user/hadoop/charlie-branch_taken_ratio' USING PigStorage(',');
