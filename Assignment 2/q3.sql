WITH RankedBrewies AS (
  SELECT
    id, name, state, rating,
    RANK() OVER (PARTITION BY state ORDER BY rating DESC) AS rating_rank
  FROM brewies
)
SELECT id, name, state, rating
FROM RankedBrewies
WHERE rating_rank = 1;
