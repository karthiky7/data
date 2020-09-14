CREATE EXTERNAL TABLE if not exists orders (order_id STRING, customer_name STRING,order_date STRING,order_status STRING)
STORED BY 'org.apache.hadoop.hive.dynamodb.DynamoDBStorageHandler'
TBLPROPERTIES ("dynamodb.table.name" = "Orders",
"dynamodb.column.mapping" = "order_id:order_id,customer_name:customer_name,order_date:order_date,order_status:status");
create database if not exists mydb;
create external table if not exists mydb.orders(order_id STRING, customer_name STRING,order_date STRING,order_status STRING) stored as parquet location 's3://deliverylogs54544322/hive';
insert overwrite table  mydb.orders select * from default.orders ;
drop table if exists default.orders;
drop database if exists default;