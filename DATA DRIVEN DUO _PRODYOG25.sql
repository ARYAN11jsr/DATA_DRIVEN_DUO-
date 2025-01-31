CREATE DATABASE PRODYOG
SELECT * FROM DATAHACKATHON_DATASET

--Q1 :Compute the Pollution Index (PI) for a given row in the dataset using the formula:
--PI=0.98×PM2.5+0.017×CO+0.158×Ozone−0.036×NO2−0.604

SELECT  0.98*[PM2#5 AQI Value] + 0.017 * [CO AQI Value] + 0.158*[Ozone AQI Value] - 0.036*[NO2 AQI Value] -.604 AS P_I 
FROM DATAHACKATHON_DATASET

--Q2 :  Identify the top 5 cities with the highest Pollution Index (PI) and compare the average PI of the top 5 cities in the USA, China, and India.
--(A)

SELECT TOP(5) CITY,[Pollution Index] FROM DATAHACKATHON_DATASET
ORDER BY [POLLUTION INDEX] DESC

-- (b)
SELECT AVG([Pollution Index]) AS Avg_Top5_Pollution
FROM (
    SELECT TOP 5 [Pollution Index]
    FROM DATAHACKATHON_DATASET
    WHERE COUNTRY = 'CHINA'
    ORDER BY [Pollution Index] DESC
) AS Top5Pollution;


SELECT AVG([Pollution Index]) AS Avg_Top5_Pollution
FROM (
    SELECT TOP 5 [Pollution Index]
    FROM DATAHACKATHON_DATASET
    WHERE COUNTRY = 'INDIA'
    ORDER BY [Pollution Index] DESC
) AS Top5Pollution;

SELECT AVG([Pollution Index]) AS Avg_Top5_Pollution
FROM (
    SELECT TOP 5 [Pollution Index]
    FROM DATAHACKATHON_DATASET
    WHERE COUNTRY = 'UNITED STATES OF AMERICA'
    ORDER BY [Pollution Index] DESC
) AS Top5Pollution;

-- CHINA = 299.631 , INDIA = 499.9242 , USA = 223.283



--3 :Determine the top 10 countries based on the average Pollution Index (PI) of their cities.
SELECT TOP(10) COUNTRY,ROUND(AVG([POLLUTION INDEX]),2) AS AVG_POPULATION_INDEX FROM DATAHACKATHON_DATASET
GROUP BY  COUNTRY
ORDER BY  AVG([POLLUTION INDEX]) DESC 

--4 :Examine the distribution of cities across different AQI categories for each country, 
--and identify the top 10 cities categorized as 'Good' in terms of the frequency of occurrences.
--(a)
SELECT COUNT(COUNTRY) AS COUNTRY_COUNT,[AQI Category] FROM DATAHACKATHON_DATASET
GROUP BY  [AQI Category]
ORDER BY COUNTRY_COUNT DESC 

-- (b)
SELECT TOP(10) CITY FROM DATAHACKATHON_DATASET
ORDER BY [AQI Value] ASC



--5 Identify and display the top 10 cities categorized as 'Unhealthy' or 'Unhealthy for Sensitive Groups'
--based on their AQI (Air Quality Index) values

SELECT TOP(10) CITY , [AQI Category] FROM DATAHACKATHON_DATASET
WHERE [AQI Category] = 'UNHEALTHY' OR [AQI Category] = 'Unhealthy for Sensitive Groups'
ORDER BY [AQI Value] DESC

-- SINCE THE AQI RANGE FOR UNHEALTHY GROUP IS 150-200 AND THE AQI RANGE FOR UNHEALTHY FOR SENSITIVE GROUP RANGES FROM 100-149. SO IN CASE OF OR WE WILL ONLY GET UNHEALHTHY GROUPS AS OUR RESULT.




-





