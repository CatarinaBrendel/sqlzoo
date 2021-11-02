/* SQL Zoo - SELECT from Game, Goal and ETeam Tutorial */
-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player
FROM goal
WHERE teamid = 'GER'

-- Show id, stadium, team1, team2 for just game 1012
SELECT id, statdium, team1, team2
FROM game
WHERE id = 1012

-- Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamidm stadium, mdate
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE goal.teamid = 'GER'

-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SEELCT team1, team2, player
FROM game JOIN goal ON(game.id = goal.matchid)
WHERE player LIKE 'Mario%'

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime <= 10

-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname
FROM game JOIN eteam ON (game.team1 = eteam.id)
WHERE  eteam.coach = 'Fernando Santos'

-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM game JOIN goal ON (game.matchid = goal.id)
WHERE game.stadium = 'National Stadium, Warsaw'

-- Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT(player)
FROM game JOIN goal ON (game.matchid = game.id)
WHERE ((team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER')

-- Show teamname and the total number of goals scored.
SELECT teamname, COUNT(player)
FROM etam JOIN goal ON eteam.id = goal.teamid
GROUP BY teamname

-- Show the stadium and the number of goals scored in each stadium. 
SELECT stadium, COUNT(player)
FROM game JOIN goal ON (game.id = goal.matchid)
GROUP BY stadium

-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, gdate, COUNT(player)
FROM game JOIN goal ON (goal.matchid = goal.id)
WHERE (team1 = 'POL' OR team2 ='POL')
GROUP BY matchid, gdate

-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(player)
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE goal.teamid = 'GER'
GROUP BY matchid, mdate

/* List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
mdate	team1	score1	team2	score2
1 July 2012	ESP	4	ITA 	0
10 June 2012	ESP	1	ITA	1
10 June 2012	IRL	1	CRO	3
...

Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column 
to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.  */

SELECT mdate,
    team1,
    SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0) AS score1,
    team2,
    SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0) AS score2
FROM game LEFT JOIN goal ON (goal.matchid = game.id)
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2