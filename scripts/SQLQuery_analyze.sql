
SELECT TOP(100) *
FROM annual_Trips

-- Creating index to get a better performence
CREATE INDEX idx_start_station_name
ON annual_trips(start_station_name);

CREATE INDEX idx_end_station_name
ON annual_trips(end_station_name);

CREATE INDEX idx_ride_length
ON annual_trips(ride_length);

-- Top 10 routes for casual riders
SELECT
	TOP(10)
	member_casual,
	CONCAT(start_station_name,' to ',end_station_name) Bike_track,
	COUNT(*) AS num_of_trips
FROM annual_Trips
WHERE 
	member_casual = 'casual'
GROUP BY member_casual, start_station_name, end_station_name
ORDER BY num_of_trips DESC

-- Top 10 most popular starting stations for casual riders
SELECT TOP(10) start_station_name, COUNT(*) AS num_of_trips
FROM annual_Trips
WHERE member_casual = 'casual' and start_station_name <> 'Unknown'
GROUP BY start_station_name
ORDER BY num_of_trips DESC;

--Change ride_length column data type to FLOAT We will do calculations on it later.
ALTER TABLE annual_trips
ALTER COLUMN ride_length FLOAT;

-- Average ride length comparison between member types
SELECT 
	TOP(10)
	member_casual,
	COUNT(*),
	ROUND(AVG(ride_length)/60,2) AS avg_ride_length
FROM annual_Trips
GROUP BY member_casual
ORDER BY avg_ride_length DESC

--Ride count by day of week for casual riders
SELECT 
	day_of_week,
	member_casual, 
	--ROUND(AVG(ride_length)/60,2) AS avg_ride_length,
	COUNT(*) AS num_of_rides
FROM annual_Trips
WHERE
	member_casual = 'casual'
GROUP BY
	day_of_week,
	member_casual
ORDER BY
	num_of_rides DESC

-- Monthly average ride length for casual riders
SELECT 
	DATENAME(MONTH, started_at) AS months,
	ROUND(AVG(ride_length)/60,2) AS avg_ride_length
FROM annual_Trips
WHERE
	member_casual = 'casual'
GROUP BY
	DATENAME(MONTH, started_at),
	DATEPART(MONTH, started_at) 
ORDER BY DATEPART(MONTH, started_at) 
	
--Electric bike usage by member type
SELECT member_casual, count(*) AS electric_bike
FROM annual_Trips
WHERE rideable_type = 'electric_bike'
GROUP BY member_casual

--Percentage of casual rides longer than 45 minutes
SELECT 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM annual_trips WHERE member_casual = 'casual') AS percent_45plus
FROM annual_trips
WHERE member_casual = 'casual' AND ride_length >= 2700; --2700sec = 45 min
