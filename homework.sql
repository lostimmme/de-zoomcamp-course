-- Question 3
SELECT COUNT(1) FROM PUBLIC.GREEN_TAXI_TRIPS WHERE lpep_pickup_datetime::DATE = '2019-01-15' AND lpep_dropoff_datetime::DATE = '2019-01-15';

-- Question 4
SELECT DATE_TRUNC('DAY', lpep_pickup_datetime) AS pu_day, MAX(trip_distance) as max_trip_distance_for_each_day
FROM PUBLIC.GREEN_TAXI_TRIPS
GROUP BY 1
ORDER BY max_trip_distance_for_each_day DESC
LIMIT 1;

--Question 5
SELECT passenger_count, count(1) as count_of_passenger_counts
FROM PUBLIC.GREEN_TAXI_TRIPS
WHERE lpep_pickup_datetime::DATE = '2019-01-01' AND (passenger_count IN (2,3))
GROUP BY 1;

--Question 6
SELECT "do_tzl"."Zone" as "Drop off zone"
FROM PUBLIC.GREEN_TAXI_TRIPS gtp
INNER JOIN PUBLIC.taxi_zone_lookup pu_tzl ON "gtp"."PULocationID" = "pu_tzl"."LocationID" 
LEFT JOIN PUBLIC.taxi_zone_lookup do_tzl ON "gtp"."DOLocationID" = "do_tzl"."LocationID"
WHERE "pu_tzl"."Zone" = 'Astoria'
ORDER BY "gtp".tip_amount DESC
LIMIT 1;

