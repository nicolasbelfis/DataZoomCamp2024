select lpep_pickup_datetime, green_taxi_data.trip_distance
from green_taxi_data
order by green_taxi_data.trip_distance desc
limit 1

select count(*)
from green_taxi_data 
where green_taxi_data.lpep_dropoff_datetime >= '2019-09-18' 
and green_taxi_data.lpep_dropoff_datetime < '2019-09-19'
and green_taxi_data.lpep_pickup_datetime >= '2019-09-18'
and green_taxi_data.lpep_pickup_datetime < '2019-09-19'

select distinct zones."Borough",sum(taxis.total_amount)
from green_taxi_data taxis
join zone_taxi_data zones
on zones."LocationID" = taxis."PULocationID"
where taxis.lpep_pickup_datetime >= '2019-09-18'
and taxis.lpep_pickup_datetime < '2019-09-19'
group by zones."Borough"
having sum(taxis.total_amount) > 50000

select max(taxis.tip_amount) as maxTip, DOzones."Zone"
from green_taxi_data taxis
join zone_taxi_data DOzones
on DOzones."LocationID" = taxis."DOLocationID"
join zone_taxi_data PUzones
on PUzones."LocationID" = taxis."PULocationID"
where taxis.lpep_pickup_datetime >= '2019-09-01'
and taxis.lpep_pickup_datetime < '2019-10-01'
and PUzones."Zone" = 'Astoria'
group by DOzones."Zone"
order by max(taxis.tip_amount) desc
limit 1