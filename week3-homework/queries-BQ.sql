-- create or replace external table nytaxi.green_taxi_2022
-- options (
--   format = 'PARQUET',
--   uris = ['gs://nytaxi_week3/green_taxi_2022.parquet']
-- );

-- create or replace table nytaxi.green_taxi_2022_internal as
-- select * from `nytaxi.green_taxi_2022`;

-- create or replace table nytaxi.green_taxi_2022_part_clust
-- partition by date(lpep_pickup_datetime)
-- cluster by PULocationID as
-- select * from `nytaxi.green_taxi_2022`;

select count(*) from `nytaxi.green_taxi_2022`;


select count(distinct PULocationID) from `nytaxi.green_taxi_2022`;
select count(distinct PULocationID) from `nytaxi.green_taxi_2022_internal`;

select count(*) from `nytaxi.green_taxi_2022`
where fare_amount = 0;

select distinct PULocationID from `nytaxi.green_taxi_2022`
where date(lpep_pickup_datetime) between '2022-06-01' and '2022-06-30';

select distinct PULocationID from `nytaxi.green_taxi_2022_part_clust`
where date(lpep_pickup_datetime) between '2022-06-01' and '2022-06-30';