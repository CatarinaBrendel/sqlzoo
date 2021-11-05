/* SQL Zoo - SMore Join operations Tutorial */
-- List the films where the yr is 1962 [Show id, title] 
SELECT id, title
FROM movie
WHERE yr=1962

-- Give year of 'Citizen Kane'. 
SELECT yr
FROM movie
WHERE title = 'Citzen Kane'

-- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. 
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Start Trek%'
ORDER BY yr

-- What id number does the actor 'Glenn Close' have? 
SELECT id
FROM actor
WHERE name = 'Glenn Close'

-- What is the id of the film 'Casablanca' 
SELECT id
FROM movie
WHERE title = 'Casablanca'

-- Obtain the cast list for 'Casablanca'
SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE casting.movieid = (SELECT id FROM movie WHERE title = 'Casablanca')

-- Obtain the cast list for the film 'Alien' 
SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE casting.movieid = (SELECT id FROM movie WHERE title = 'Alien')

-- List the films in which 'Harrison Ford' has appeared 
SELECT title
FROM movie JOIN casting ON (movie.id = casting.movieid)
WHERE casting.actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')

-- List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] 
SELECT title
FROM movie JOIN casting ON (movie.id = casting.movieid)
WHERE casting.ord != 1 AND casting.actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')

-- List the films together with the leading star for all 1962 films. 
SELECT movie.title, actor.name
FROM movie 
    JOIN casting ON (movie.id = casting.movieid)
    JOIN actor ON(actor.id = casting.actorid)
WHERE casting.ord = 1 AND movie.yr = 1962

-- Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies. 
SELECT yr, COUNT(title) 
FROM movie
    JOIN casting ON (movie.id = casting.movieid)
    JOIN actor ON (actor.id = casting.actorid)
WHERE actor.name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(movie.title) > 2

-- List the film title and the leading actor for all of the films 'Julie Andrews' played in. 
SELECT title, actor.name
FROM movie 
    JOIN casting ON (movie.id = casting.movieid AND casting.ord = 1)
    JOIN actor ON (actor.id = casting.actorid)
WHERE movie.id IN (
    SELECT casting.movieid 
    FROM casting 
    WHERE casting.actorid IN (
        SELECT actor.id 
        FROM actor 
        WHERE actor.name = 'Julie Andrews'))
-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT actor.name
FROM actor  
    JOIN casting ON (actor.id = casting.actorid)
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(actor.name) >= 15
ORDER BY actor.name

-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title. 
SELECT movie.title, COUNT(casting.actorid)
FROM movie
    JOIN casting ON (movie.id = casting.movieid)
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title

-- List all the people who have worked with 'Art Garfunkel'. 
SELECT actor.name
FROM actor
    JOIN casting ON (actor.id = casting.actorid)
WHERE casting.movieid IN (
    SELECT casting.movieid
    FROM casting
    WHERE casting.actorid IN (
        SELECT actor.id 
        FROM actor
        WHERE actor.name = 'Art Garfunkel'
    )
)
AND actor.name <> 'Art Garfunkel'