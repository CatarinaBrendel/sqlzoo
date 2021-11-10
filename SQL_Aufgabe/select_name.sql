/* SQL Zoo - Select Name SQL Wildcards Tutorial */
-- Find the country that start with Y
SELECT name
FROM world
WHERE name LIKE 'Y%'

-- Find the countries that end with y
SELECT name 
FROM world
WHERE name LIKE '%y'

-- Find the countries that contain the letter x
SELECT name 
FROM world
WHERE name LIKE '%x%'

-- Find the countries that end with land
SELECT name
FROM world
WHERE name LIKE '%land'

-- Find the countries that start with C and end with ia
SELECT name 
FROM world
WHERE name LIKE 'C%ia'

-- Find the country that has oo in the name
SELECT name 
FROM world
WHERE name LIKE '%oo%'

-- Find the countries that have three or more 'a' in the name
SELECT name
FROM world
WHERE name LIKE '%a%a%a%'

-- Find the countries that have 't' as the second character
SEELCT name
FROM world
WHERE name LIKE '_t%'
ORDER BY name

-- Find the countries that have two 'o' characters separated by two others
SELECT name
FROM world
WHERE name LIKE '%o__o%'

-- Find the countries that have exactly four charactes
SELECT name
FROM world
WHERE LENGTH(name) = 4

-- Find the country where the name is the capital city
SELECT name
FROM world
WHERE name = capital

-- Find the country where the capital is the country plus 'City'
SELECT name 
FROM world
WHERE capital = CONCAT(name, ' City')

-- Find the capital and the name where the capital incldudes the name of the country
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%')

-- Find the capital and the name where the capital is an extension of the name of the country
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%') AND capital != name

-- Show the name and the extension where the capital is an extensio of name of the country
SELECT name, REPLACE(capital, name, '')
FROM world
WHERE capital LIKE CONCAT('%', name, '%') AND capital > name