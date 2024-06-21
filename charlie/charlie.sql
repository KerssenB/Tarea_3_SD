create external table charlie (
    branch_addr string,
    branch_type string,
    taken int,
    description string)
row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile 
location 'hdfs://localhost:9000/user/hadoop/charlie_hive';

load data inpath 'hdfs://localhost:9000/user/hadoop/input/charlie_trace-1_17571657100049929577.branch_trace.1006511.csv' overwrite into table charlie;
