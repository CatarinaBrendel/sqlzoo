/* SQL Zoo - SELECT from World Tutorial */
/*
    By including a GROUP BY clause functions such as SUM and COUNT are applied to groups of items sharing values.
    The HAVING clause allows use to filter the groups which are displayed. 
    The WHERE clause filters rows before the aggregation, the HAVING clause filters after the aggregation. 
*/

-- For each continent show the number of countries:
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

-- For each continent show the total population:
SELECT continent, SUM(population)
FROM world
GROUP BY continent

-- For each relevant continent show the number of countries that has a population of at least 200000000. 
SELECT continent, COUNT(name)
FROM world
GROUP BY continent
HAVING population > 200000000

-- Show the total population of those continents with a total population of at least half a billion. 
SELECT continent, SUM(population)
FROM world
GROUP BY continent
HAVING SUM(population) > 5000000000