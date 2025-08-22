


--verify that the data was imported up to the last month of the year
SELECT TOP(1000)*
FROM annual_Trips
where MONTH(started_at) = 12
ORDER BY started_at ASC;

--Count the empty values ​​in each column separately
SELECT
    COUNT(CASE WHEN ride_id IS NULL THEN 1 END) AS Nulls_ride_id,
    COUNT(CASE WHEN rideable_type IS NULL THEN 1 END) AS Nulls_rideable_type,
    COUNT(CASE WHEN started_at IS NULL THEN 1 END) AS Nulls_started_at,
    COUNT(CASE WHEN ended_at IS NULL THEN 1 END) AS Nulls_ended_at,
    COUNT(CASE WHEN start_station_name IS NULL THEN 1 END) AS Nulls_start_station_name,
    COUNT(CASE WHEN start_station_id IS NULL THEN 1 END) AS Nulls_start_station_id,
    COUNT(CASE WHEN end_station_name IS NULL THEN 1 END) AS Nulls_end_station_name,
    COUNT(CASE WHEN end_station_id IS NULL THEN 1 END) AS Nulls_end_station_id,
    COUNT(CASE WHEN start_lat IS NULL THEN 1 END) AS Nulls_start_lat,
    COUNT(CASE WHEN start_lng IS NULL THEN 1 END) AS Nulls_start_lng,
    COUNT(CASE WHEN end_lat IS NULL THEN 1 END) AS Nulls_end_lat,
    COUNT(CASE WHEN end_lng IS NULL THEN 1 END) AS Nulls_end_lng,
    COUNT(CASE WHEN member_casual IS NULL THEN 1 END) AS Nulls_member_casual
FROM annual_trips;

--Find out how many trips is NULL at both the starting and ending stations.
SELECT COUNT(*)
FROM annual_trips
where start_station_name IS NULL AND end_station_name IS NULL;

-- Counts the number of NULL values in 'start_station_name' for each month
SELECT MONTH(started_at) AS months, count(*) AS NULL_VALUES
FROM annual_trips
WHERE start_station_name IS NULL
GROUP BY MONTH(started_at)
ORDER BY NULL_VALUES

--Modify values ​​in the table to replace NULL values.
BEGIN TRANSACTION;
UPDATE annual_trips
SET
    start_station_name = CASE WHEN start_station_name IS NULL THEN 'Dockless_Start' ELSE start_station_name END,
    end_station_name = CASE WHEN end_station_name IS NULL THEN 'Dockless_End' ELSE end_station_name END,
    start_station_id = CASE WHEN start_station_id IS NULL THEN 'NO_DOCK_ID_START' ELSE start_station_id END,
    end_station_id = CASE WHEN end_station_id IS NULL THEN 'NO_DOCK_ID_END' ELSE end_station_id END;
COMMIT TRANSACTION

--Check that there are no empty values ​​in the columns member_casual rideable_type
SELECT DISTINCT member_casual
FROM [annual_Trips]
SELECT DISTINCT rideable_type
FROM [annual_Trips]

--Checking for a logical error where the start date is greater than the end date
SELECT COUNT(CASE WHEN started_at > ended_at THEN 1 END ) AS Invalid_date
FROM annual_Trips

--Delete invalid values
DELETE FROM annual_Trips
where started_at > ended_at;

--Create a new column to extract the bike rental duration.
ALTER TABLE annual_Trips
ADD ride_length FLOAT;

--extract the bike rental duration.
UPDATE annual_Trips
SET ride_length = DATEDIFF(second, started_at, ended_at);

--Create new column to extract which day of the week the bike was rented
ALTER TABLE annual_trips
ADD day_of_week AS DATENAME(WEEKDAY, started_at);

--Retrieves the maximum and minimum ride durations To ensure that there are no values ​​outside the reasonable range.
SELECT MAX(ROUND(ride_length,2)) AS MAX_RIDE_LENGTH, MIN(ROUND(ride_length,2)) AS MAX_RIDE_LENGTH
FROM annual_Trips

-- Finds the top 10 longest rides, sorted in descending order
SELECT TOP(10) ROUND(ride_length/60,2) AS RIDE_LENGTH
FROM annual_Trips
ORDER BY RIDE_LENGTH DESC

-- Find out how many casual users drive for more than an hour.
SELECT  COUNT(*) AS casuals_ride_lenght
FROM annual_Trips
WHERE ride_length > 3600 AND member_casual = 'casual'