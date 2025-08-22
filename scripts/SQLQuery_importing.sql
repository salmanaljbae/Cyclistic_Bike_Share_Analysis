--Stage 1: Importing data

USE master;
GO

--Create the database and specify its files and their physical location on the hard disk.
CREATE DATABASE BikeShareDB ON 
PRIMARY (
    NAME = 'BikeShareDB',
    FILENAME = 'E:\Data_analysis_dataBases\BikeShare\BikeShareDB.mdf'
)
LOG ON (
    NAME = 'BikeShareDB_log',
    FILENAME = 'E:\Data_analysis_dataBases\BikeShare\BikeShareDB_log.ldf'
)
GO

--Using the database
USE BikeShareDB
Go

--Create the table to import data into
CREATE TABLE annual_Trips (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);

--Import data from the CSV files
BULK INSERT annual_Trips
FROM 'F:\LEARNING\Data_Alanlysis\Coursera\8- capstone\datasets\divvy_tripdata_2024\12.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 
);

-- Back up data before modifying it
SELECT *
INTO Trips_row_data
FROM annual_trips;

--Test that the import process was successful
select top(1000) * from Trips_row_data