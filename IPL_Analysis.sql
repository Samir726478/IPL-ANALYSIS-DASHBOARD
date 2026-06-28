-- ================================================
-- IPL ANALYSIS PROJECT
-- Author: Samir Sipai
-- Tools: MySQL, Power BI
-- ================================================

USE ipl;

-- Q1: Which team won the most matches?
SELECT winner, COUNT(*) AS total_wins
FROM matches
WHERE winner != ''
GROUP BY winner
ORDER BY total_wins DESC
LIMIT 10;

-- Q2: Top run scorers
SELECT batter, SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 10;

-- Q3: Top wicket takers
SELECT bowler, COUNT(*) AS total_wickets
FROM deliveries
WHERE is_wicket = '1'
GROUP BY bowler
ORDER BY total_wickets DESC
LIMIT 10;

-- Q4: Most matches by venue
SELECT venue, COUNT(*) AS total_matches
FROM matches
GROUP BY venue
ORDER BY total_matches DESC
LIMIT 10;

-- Q5: Toss decision vs win analysis
SELECT toss_decision, COUNT(*) AS total,
SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) AS toss_then_win
FROM matches
GROUP BY toss_decision;

-- Q6: Player of the match awards
SELECT player_of, COUNT(*) AS total_awards
FROM matches
WHERE player_of != ''
GROUP BY player_of
ORDER BY total_awards DESC
LIMIT 10;

-- Q7: Total runs per season
SELECT m.season, SUM(d.batsman_runs) AS total_runs
FROM matches m
JOIN deliveries d ON m.id = d.match_id
GROUP BY m.season
ORDER BY m.season;

-- Q8: Most sixes by batter
SELECT batter, COUNT(*) AS total_sixes
FROM deliveries
WHERE batsman_runs = '6'
GROUP BY batter
ORDER BY total_sixes DESC
LIMIT 10;