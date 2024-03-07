SELECT first_name, last_name FROM (
    SELECT id, first_name, last_name FROM (
        SELECT players.id AS id, first_name, last_name FROM players
        JOIN salaries ON salaries.player_id = players.id
        JOIN performances ON performances.player_id = players.id
            AND salaries.year = performances.year
        WHERE salaries.year = 2001
            AND H > 0
        ORDER BY salary/H
        LIMIT 10
    )

INTERSECT

    SELECT id, first_name, last_name FROM (
        SELECT players.id AS id, first_name, last_name FROM players
        JOIN salaries ON salaries.player_id = players.id
        JOIN performances ON performances.player_id = players.id
            AND salaries.year = performances.year
        WHERE salaries.year = 2001
            AND RBI > 0
        ORDER BY salary/RBI
        LIMIT 10
    )
)
ORDER BY id;
