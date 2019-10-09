-- Using MySQL-client 
-- 1.create a database world
-- 2.create a table country
-- 3. create a table city 
-- 4.Insert 10-20 rows in each table with relevant fields.

-- Homework below

DROP DATABASE IF EXISTS world;
CREATE DATABASE world;
USE world;


--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS country;

CREATE TABLE
IF NOT EXISTS country
(
  CountryID CHAR
(3) NOT NULL DEFAULT '',
  CountryName CHAR
(52) NOT NULL DEFAULT '',
  CountryPopulation INT
(11) NOT NULL DEFAULT '0',
  CountrySurfaceArea FLOAT
(10,2) NOT NULL DEFAULT '0.00',
  Continent enum
('Asia','Europe', 'North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  PRIMARY KEY
(CountryID)
);


--
-- Data for table `country`
--

INSERT INTO country
  (CountryID, CountryName, CountryPopulation, CountrySurfaceArea, Continent)
VALUES
  ( 1, 'Japan', 126854745, 377930, 'Asia'),
  ( 2, 'Mexico', 132328035, 1964375, 'North America'),
  ( 3, 'Nigeria', 200962417, 923768, 'Africa'),
  ( 4, 'Russia', 143895551, 17098242, 'Europe'),
  ( 5, 'France', 65480710, 551695, 'Europe'),
  ( 6, 'United Kingdom', 66959016, 242900, 'Europe'),
  ( 7, 'Canada', 37279811, 9984670, 'North America'),
  ( 8, 'Austria', 8766201, 83871, 'Europe'),
  ( 9, 'Sweden', 10053135, 450295, 'Europe'),
  ( 10, 'Netherlands', 17132908, 41850, 'Europe'),
  ( 11, 'Slovakia', 5450987, 49037, 'Europe'),
  ( 12, 'Egypt', 101168745, 1002450, 'Africa'),
  ( 13, 'Australia', 25088636, 7692024, 'Oceania'),
  ( 14, 'Tanzania', 60913557, 945087, 'Africa'),
  ( 15, 'South Korea', 51339238, 100210, 'Asia'),
  ( 16, 'Peru', 32933835, 1285216, 'South America'),
  ( 17, 'Yemen', 29579986, 527968, 'Asia'),
  ( 18, 'Sri Lanka', 21018859, 65610, 'Asia'),
  ( 19, 'Mali', 19689140, 1240192, 'Africa'),
  ( 20, 'Burundi', 11575964, 27834, 'Africa');


--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS city;

CREATE TABLE city
(
  CityID INT(11) NOT NULL
  AUTO_INCREMENT,
  CityName CHAR
  (35) NOT NULL DEFAULT '',
  CityPopulation INT
  (11) NOT NULL DEFAULT '0',
  CountryCode CHAR
  (3) NOT NULL DEFAULT '',
  PRIMARY KEY
  (CityID),
  FOREIGN KEY
  (CountryCode) REFERENCES world.country
  (CountryID)
);

  --
  -- Data for table `city`
  --


  INSERT INTO city
    (CityName, CityPopulation, CountryCode)
  VALUES
    ('Tokyo', 37435191, 1),
    ('Mexico City', 21671908, 2),
    ('Moscow', 12476171, 4),
    ('Paris', 10958187, 5),
    ('London', 9176530, 6),
    ('Guadalajara', 5100527, 2),
    ('Montreal', 4195523, 7),
    ('Toronto', 6139404, 7),
    ('Manchester', 2710074, 6),
    ('Vancouver', 2555884, 7),
    ('Tijuana', 2099293, 2),
    ('Hiroshima', 2089157, 1),
    ('Vienna', 1915338, 8),
    ('Glasgow', 1666632, 6),
    ('Stockholm', 1608037, 9),
    ('Amsterdam', 1140339, 10),
    ('Rotterdam', 1008667, 10),
    ('Bratislava', 532508, 11),
    ('Cairo', 20484965, 12),
    ('Lagos', 13903620, 3);
