create external table merced (
    branch_addr string,
    branch_type string,
    taken int,
    description string)
row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile 
location 'hdfs://localhost:9000/user/hadoop/merced_hive';

load data inpath 'hdfs://localhost:9000/user/hadoop/input/merced_trace-1_13378400607429273214.branch_trace.467769.csv' overwrite into table merced;
