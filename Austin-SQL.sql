/* 
PUBLIC DATASET URL   : https://console.cloud.google.com/marketplace/details/city-of-austin/austin-crime
DATASET DESCRIPTION  :
This dataset includes Part 1 crimes (as defined by Uniform Crime Reporting Statistics ) for 2014 and 2015. Data is provided by the Austin Police Department and may differ from official APD crime data due to the variety of reporting and collection methods used.
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
1.This query would display first 1000 rows of database with all of its attributes.
--------------------------------------------------------------------------------------------------
*/

SELECT * 
FROM `bigquery-public-data.austin_crime.crime` 
LIMIT 1000
/*
---------------------------------------------------------------------------------------------------
2. This query returns all the crime records registered in the year 2016
---------------------------------------------------------------------------------------------------
*/
SELECT * 
FROM `bigquery-public-data.austin_crime.crime` 
WHERE year = 2016
/*
---------------------------------------------------------------------------------------------------
3.Display clearence date of each crime with crime description
----------------------------------------------------------------------------------------------------
*/
SELECT clearance_date,description 
FROM `bigquery-public-data.austin_crime.crime` 
/*
-----------------------------------------------------------------------------------------------------
4.This query would return the total number of rows of data in the database
-----------------------------------------------------------------------------------------------------
*/
SELECT count(*)
FROM `bigquery-public-data.austin_crime.crime` 
\*
-----------------------------------------------------------------------------------------------------
5. Returns the number of crime with clearence_status as "Not cleared"
-----------------------------------------------------------------------------------------------------
*/
SELECT count(*)
FROM `bigquery-public-data.austin_crime.crime` WHERE clearance_status= "Not cleared"
\*
-----------------------------------------------------------------------------------------------------
6. GROUPS THE CRIME TYPE AND DISPLAY THE TOTAL COUNTS OF EACH GROUP
-----------------------------------------------------------------------------------------------------
*/

SELECT primary_type,count(primary_type)
FROM `bigquery-public-data.austin_crime.crime`
GROUP BY primary_type
\*
-----------------------------------------------------------------------------------------------------
7. This joins two tables from two diffrent database[1.AUSTIN CRIME DATABASE 2.CHICAGO CRIME DATABASE]
   and display the address of crime scene where the crime incident years are matching in the two tables
-----------------------------------------------------------------------------------------------------
*/
SELECT ADDRESS FROM `bigquery-public-data.austin_crime.crime` austin
INNER JOIN `bigquery-public-data.chicago_crime.crime` chicago
ON austin.year = chicago.year
\*
-----------------------------------------------------------------------------------------------------
8. Returns the latitude and longitude of Crime Scene from Chicago crime database and Austin Crime database
-----------------------------------------------------------------------------------------------------
*/
SELECT austin.latitude,austin.longitude,chicago.x_coordinate,chicago.y_coordinate FROM `bigquery-public-data.austin_crime.crime` austin
FROM `bigquery-public-data.chicago_crime.crime` chicago
ON austin.year = chicago.year
\*
-----------------------------------------------------------------------------------------------------
9. Returns unique_key and description based on the descending order of clearence_date
-----------------------------------------------------------------------------------------------------
*/
SELECT  unique_key,description 
FROM `bigquery-public-data.austin_crime.crime` 
ORDER BY clearance_date DESC
\*
-----------------------------------------------------------------------------------------------------
10. Retrive attributes from table where primary_type starts and ends with 'R' and 'e'
-----------------------------------------------------------------------------------------------------
*/

SELECT * FROM
`bigquery-public-data.austin_crime.crime` 
WHERE primary_type LIKE 'R%e'
