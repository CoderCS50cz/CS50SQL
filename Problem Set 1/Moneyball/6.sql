SELECT name, SUM(H) AS "total hits" FROM teams
JOIN performances ON teams.id = performances.team_id
WHERE performances.year = 2001
GROUP BY teams.name
ORDER BY SUM(H) DESC
LIMIT 5;
