-- Import the database **new_world** (using the new_world.sql-file), 
-- then query (using select statements) the **new_world** database to answer following questions
-- Run by writing in the mysql prompt: source query_new_world.sql;

-- source new_world;
use new_world;

-- 1. What are the names of countries with population greater than 8 million
SELECT country.Name, country.Population
FROM country
WHERE country.Population > 8000000;
-- -- 2. What are the names of countries that have “land” in their names ?
SELECT Name
FROM country
WHERE Name LIKE "%land%";
-- -- 3. What are the names of the cities with population in between 500,000 and 1 million ?
SELECT Name, Population
FROM city
WHERE Population BETWEEN 500000 AND 1000000;
-- -- 4. What's the name of all the countries on the continent ‘Europe’ ?
SELECT Name
FROM country
WHERE Continent = "Europe";
-- -- 5. List all the countries in the descending order of their surface areas.
SELECT Name, SurfaceArea
FROM country
ORDER BY SurfaceArea DESC;
-- -- 6. What are the names of all the cities in the Netherlands?
SELECT city.Name, country.Name
FROM country INNER JOIN city ON city.CountryCode = country.Code
WHERE country.Name LIKE "Netherlands";
-- -- 7. What is the population of Rotterdam ?
SELECT Name, Population
FROM city
WHERE Name = "Rotterdam";
-- -- 8. What's the top 10 countries by Surface Area ?
SELECT Name, SurfaceArea
FROM country
ORDER BY SurfaceArea DESC LIMIT 10;
-- -- 9. What's the top 10 most populated cities?
SELECT Name
, Population
FROM city
ORDER BY Population DESC LIMIT 10;
-- -- 10. What is the population of the world ?
SELECT SUM
(Population) AS "World Population"
FROM country;
