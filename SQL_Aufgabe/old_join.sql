/* SQL Zoo - Old Join Tutorial */
-- Show the athelete (who) and the country name for medal winners in 2000. 
SELECT who, country.name
FROM ttms JOIN country ON (tms.country = country.id)
WHERE games = 2000

-- Show the who and the color of the medal for the medal winners from 'Sweden'. 
SELECT who, color
FROM ttms JOIN country ON (ttms.country = coutnry.id)
WHERE country.name = 'Sweden'

-- Show the years in which 'China' won a 'gold' medal. 
SELECT games
FROM ttms JOIN country ON(ttms.country = country.name)
WHERE country.name = 'China' AND ttms.color = 'gold'

-- Show who won medals in the 'Barcelona' games. 
SELECT who
FROM ttms JOIN country ON (ttms.country = country.id)
WHERE city = 'Barcelona'

-- Show which city 'Jing Chen' won medals. Show the city and the medal color. 
SELECT city, color
FROM ttws JOIN games ON (ttws.games = games.yr)
WHERE ttws.who = 'Jing Chen'

-- Show who won the gold medal and the city. 
SELECT who, city
FROM ttws JOIN games ON (ttws.games = games.yr)
WHERE ttws.color = 'gold'

-- Show the games and color of the medal won by the team that includes 'Yan Sen'.
SELECT games, color
FROM ttmd JOIN team ON (ttmd.team = team.id)
WHERE team.name LIKE 'Yan Sen'

-- Show the 'gold' medal winners in 2004. 
SELECT name 
FROM team JOIN ttmd ON (team.id = ttmd.team)
WHERE ttmd.color = 'gold' && ttmd.game = 2004

-- Show the name of each medal winner country 'FRA'. 
SELECT name
FROM team JOIN ttmd ON (team.id = ttmd.team)
WHERE team JOIn ttmd ON (team.id = ttmd.team)
WHERE ttmd.country = 'FRA'