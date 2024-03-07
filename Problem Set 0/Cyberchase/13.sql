SELECT "season", "episode_in_season", "title", "topic", "air_date", "production_code" FROM "episodes" WHERE "topic" LIKE '% in %' AND "air_date" BETWEEN '2005-08-01' AND '2008-12-31';
