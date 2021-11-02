/* SQL Zoo - SELECT from Game, Goal and ETeam Tutorial */
-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
-- Show id, stadium, team1, team2 for just game 1012
-- Modify it to show the player, teamid, stadium and mdate for every German goal.
-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
-- Instead show the name of all players who scored a goal against Germany.
-- Show teamname and the total number of goals scored.
-- Show the stadium and the number of goals scored in each stadium. 
-- For every match involving 'POL', show the matchid, date and the number of goals scored.
-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
/* List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
mdate	team1	score1	team2	score2
1 July 2012	ESP	4	ITA 	0
10 June 2012	ESP	1	ITA	1
10 June 2012	IRL	1	CRO	3
...

Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column 
to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.  */