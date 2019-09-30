-- 1) List each country name where the population is larger than that of 'Russia'.

-- answer:
SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

-- 2) Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

-- answer:
SELECT name FROM world
WHERE continent = 'Europe' AND GDP/population > (SELECT GDP/population 
FROM world WHERE name = 'United Kingdom');

-- 3) List the name and continent of countries in the continents containing either 
--    Argentina or Australia. Order by name of the country.

-- answer:
SELECT name, continent FROM world
WHERE continent LIKE ('South America') OR continent LIKE ('Oceania')
ORDER BY name;

-- 4) Which country has a population that is more than Canada but less than Poland? 
--    Show the name and the population.

-- answer:
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE
name = 'Canada') AND population < (SELECT population FROM world WHERE
name = 'Poland');

-- 5) Show the name and the population of each country in Europe. Show the population 
--    as a percentage of the population of Germany.

-- answer:
SELECT name, CONCAT(ROUND(100 * population/
(SELECT population FROM world WHERE name = 'Germany')), '%')
FROM world WHERE continent = 'Europe';

-- 6) Which countries have a GDP greater than every country in Europe? [Give the name 
--    only.] (Some countries may have NULL gdp values)

-- answer:
SELECT name
FROM world
WHERE GDP > ALL(SELECT GDP
FROM world
WHERE GDP>0 AND continent = 'Europe')

-- 7) Find the largest country (by area) in each continent, show the continent, the name and the area:

-- answer:
SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent
AND area>0)

-- 8) List each continent and the name of the country that comes first alphabetically.

-- answer:
SELECT continent, name FROM world x
WHERE name <= ALL
(SELECT name FROM world y
WHERE y.continent=x.continent)

-- 9) Find the continents where all countries have a population <= 25000000. Then find the names 
--    of the countries associated with these continents. Show name, continent and population.

-- answer:
SELECT name, continent, population FROM world
WHERE population <= 25000000 AND continent IN ('Caribbean', 'Oceania');

-- 10) Some countries have populations more than three times that of any of their neighbours 
--     (in the same continent). Give the countries and continents.

-- answer:
SELECT name, continent FROM world x
WHERE population > ALL
(SELECT population * 3 FROM world y
WHERE y.continent=x.continent 
AND population >0 AND y.name != x.name);

----------------------------------------------------------------------------------------------------------------

-- Nested SELECT Quiz

-- 1) Select the code that shows the name, region and population of the smallest country in each region

-- answer:
SELECT region, name, population FROM bbc x WHERE population <= ALL 
(SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

-- 2) Select the code that shows the countries belonging to regions with all populations over 50000

-- answer:
SELECT name,region,population FROM bbc x WHERE 50000 < ALL 
(SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

-- 3) Select the code that shows the countries with a less than a third of the population of the countries around it

-- answer:
SELECT name, region FROM bbc x
WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

-- 4) Select the result that would be obtained from the following code:

-- answer:
/* Table-D
France
Germany
Russia
Turkey */

-- 5) Select the code that would show the countries with a greater GDP than any country in Africa 
--    (some countries may have NULL gdp values).

-- answer:
SELECT name FROM bbc
WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

-- 6) Select the code that shows the countries with population smaller than Russia but bigger than Denmark

-- answer:
SELECT name FROM bbc
WHERE population < (SELECT population FROM bbc WHERE name='Russia')
AND population > (SELECT population FROM bbc WHERE name='Denmark')

-- 7) Select the result that would be obtained from the following code:

-- answer:
/* Table-B
Bangladesh
India
Pakistan */
