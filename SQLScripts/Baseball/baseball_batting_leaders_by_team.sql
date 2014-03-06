use baseball;

/*  1: Simple select on batting table */
Select * 
from batting;

/* viewing the best batting averages
simple order by clause */
Select * 
from batting 
order by BattingAvg DESC;


/* 2:  Trying to find the teams associated with a player 
simple select on team 
Team.ID of 20 is St. Louis*/
Select * 
from Team 
where ID = 20;

/*  3:  INNER JOIN - Joining 2 tables together
Creating a simle INNER JOIN to join batting to team */
Select team.ID, team.TeamName, batting.TeamID, batting.Rank, batting.BattingAvg
FROM team INNER JOIN batting on team.ID = batting.TeamID;


/*  4:  INNER JOIN - Joining 3 tables together
adding the player table to the previous query 
using an additional INNER JOIN statement to join player
to batting
*/

SELECT batting.PlayerID, batting.Rank, player.FirstName, player.LastName
, batting.BattingAvg, batting.TeamID, team.TeamName
FROM team INNER JOIN batting on team.ID = batting.TeamID
INNER JOIN player ON batting.PlayerID = player.ID;

/* 5:  Joining the team with the batting table*/
Select batting.BattingAvg
, Team.TeamName 
from batting JOIN TEAM on Team.ID = batting.TeamID 
order by BattingAvg DESC;






/* finding the average batting averages by Team 
using the Avg function and the Group by clause
*/
Select AVG(batting.BattingAvg)
, Team.TeamName 
from batting 
JOIN TEAM on Team.ID = batting.TeamID 
Group By Team.TeamName;

/* finding the teams that have more than one batting leader
use the count function to count the rows from the batting table
 */
Select AVG(batting.BattingAvg) as TeamLeadersBattingAvg
, COUNT(batting.ID) as PlayerCount
, Team.TeamName 
from batting JOIN TEAM on Team.ID = batting.TeamID 
Group By Team.TeamName;

/*
Same query but order by the highest average
*/
Select AVG(batting.BattingAvg) as TeamLeadersBattingAvg
, COUNT(batting.ID) as PlayerCount
, Team.TeamName 
from batting JOIN TEAM on Team.ID = batting.TeamID 
Group By Team.TeamName 
ORDER BY TeamLeadersBattingAvg DESC; 

/* Determine the teams with more than one batting leader
Use the Having clause to evaluate the rows 
 after they have been grouped together
*/
Select AVG(batting.BattingAvg) as TeamLeadersBattingAvg
, COUNT(batting.ID) as PlayerCount
, Team.TeamName
from batting JOIN TEAM on Team.ID = batting.TeamID 
Group By Team.TeamName 
HAVING PlayerCount > 1;

/*
Same query by order by the highest average
*/
Select AVG(batting.BattingAvg) as TeamLeadersBattingAvg
, COUNT(batting.ID) as PlayerCount
, Team.TeamName 
from batting JOIN TEAM on Team.ID = batting.TeamID 
Group By Team.TeamName 
HAVING PlayerCount > 1 
ORDER BY TeamLeadersBattingAvg DESC; 







