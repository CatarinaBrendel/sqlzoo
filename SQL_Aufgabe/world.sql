/* SQL Zoo - SELECT from World Tutorial */
-- Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries. 
SELECT *
FROM world

-- How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros. 
SELECT *
FROM world
WHERE population >= 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million. 
SELECT name, GDP/population
FROM world
WHERE population >= 200000000

-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions. 
SELECT name, population/1000000
FROM world
WHERE continent LIKE 'South America'

-- Show the name and population for France, Germany, Italy 
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'France')

-- Show the countries which have a name that includes the word 'United' 
SELECT name
FROM world
WHERE name LIKE 'United%'

-- Show the countries that are big by area or big by population. Show name, population and area.


-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places. 

-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000. 

-- Show the name and capital where the name and the capital have the same number of characters.

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

-- Find the country that has all the vowels and no spaces in its name.

-- 