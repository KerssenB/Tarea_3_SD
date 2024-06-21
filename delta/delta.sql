create external table delta (
    branch_addr string,
    branch_type string,
    taken int,
    description string)
row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile 
location 'hdfs://localhost:9000/user/hadoop/delta_hive';

load data inpath 'hdfs://localhost:9000/user/hadoop/input/delta_trace-1_10058381926338669845.branch_trace.507251.csv' overwrite into table delta;
