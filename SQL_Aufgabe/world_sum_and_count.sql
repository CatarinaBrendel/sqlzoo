/* SQL Zoo - SELECT from World Tutorial */
/*
    By including a GROUP BY clause functions such as SUM and COUNT are applied to groups of items sharing values.
    The HAVING clause allows use to filter the groups which are displayed. 
    The WHERE clause filters rows before the aggregation, the HAVING clause filters after the aggregation. 
*/
-- Show the total population of the world. 
SELECT SUM(population)
FROM world

-- List all the continents - just once each. 
SELECT DISTINCT continent
FROM world

-- Give the total GDP of Africa 
SELECT SUM(GDP)
FROM world
WHERE continent = 'Africa'

-- How many countries have an area of at least 1000000 
SELECT COUNT(name)
FROM world
WHERE area >= 1000000

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania') 
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- For each continent show the continent and number of countries. 
SELECT continent, SUM(name)
FROM world
GROUP BY continent

-- For each continent show the continent and number of countries with populations of at least 10 million. 
SEELCT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent

-- List the continents that have a total population of at least 100 million. 
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000