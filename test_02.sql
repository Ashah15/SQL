-- -- Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.
-- -- SELECT name, continent, population FROM world



-- How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

-- Answer
SELECT name FROM world
WHERE population >= 200000000


-- Give the name and the per capita GDP for those countries with a population of at least 200 million.

-- HELP:How to calculate per capita GDP

-- Answer
SELECT name, gdp/population AS Per_capita_GDP
FROM world
WHERE population >= 200000000


-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
-- Answer

SELECT name, population/1000000 AS population
FROM world
WHERE continent = 'South America'

-- Show the name and population for France, Germany, Italy
-- Answer
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'
-- Answer

SELECT name
FROM world
WHERE name LIKE '%United%'


Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.
-- Answer
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

-- Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.

-- Australia has a big area but a small population, it should be included.
-- Indonesia has a big population but a small area, it should be included.
-- China has a big population and big area, it should be excluded.
-- United Kingdom has a small population and a small area, it should be excluded
-- Answer
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000


-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

-- For South America show population in millions and GDP in billions both to 2 decimal places.
-- Millions and billions

-- Answer

SELECT name, ROUND(population/1000000, 2) AS Population_per_million,  ROUND(gdp/1000000000,2) AS GDP_per_billion
FROM world
WHERE continent = 'South America'

-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.

-- Answer

SELECT name, ROUND(gdp/population, -3) AS Per_Capita_GDP
FROM world
WHERE gdp >= 1000000000000


-- Greece has capital Athens.

-- Each of the strings 'Greece', and 'Athens' has 6 characters.

-- Show the name and capital where the name and the capital have the same number of characters.

-- You can use the LENGTH function to find the number of characters in a string

-- Answer
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

--  The capital of Sweden is Stockholm. Both words start with the letter 'S'.

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- You can use the function LEFT to isolate the first character.
-- You can use <> as the NOT EQUALS operator.

-- Answer
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital


-- Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

-- Find the country that has all the vowels and no spaces in its name.

-- You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
-- The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'


-- Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

-- Find the country that has all the vowels and no spaces in its name.

-- You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
-- The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'

-- Answer

SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';


-- Select the code which gives the name of countries beginning with U
-- Answer
-- SELECT name
--   FROM world
--  WHERE name LIKE 'U%'

-- Select the code which shows just the population of United Kingdom?
-- Answer
-- SELECT population
--   FROM world
--  WHERE name = 'United Kingdom'

-- Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
--  SELECT continent 
--    FROM world 
--   WHERE 'name' = 'France'

-- 'name' should be name

-- Select the result that would be obtained from the following code:
--  SELECT name, population / 10 
--   FROM world 
--  WHERE population < 10000

--  Nauru	990
-- 
 -- Select the code which would reveal the name and population of countries in Europe and Asia
 -- SELECT name, population
 --  FROM world
 -- WHERE continent IN ('Europe', 'Asia')


-- Select the code which would give two rows

-- SELECT name FROM world
--  WHERE name IN ('Cuba', 'Togo')

-- Select the result that would be obtained from this code:
-- SELECT name FROM world
--  WHERE continent = 'South America'
--    AND population > 40000000

-- Brazil
-- Colombia