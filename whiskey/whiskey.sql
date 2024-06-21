create external table whiskey (
    branch_addr string,
    branch_type string,
    taken int,
    description string)
row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile 
location 'hdfs://localhost:9000/user/hadoop/whiskey_hive';

load data inpath 'hdfs://localhost:9000/user/hadoop/input/whiskey_trace-1_1748052322638680856.branch_trace.426708.csv' overwrite into table whiskey;
