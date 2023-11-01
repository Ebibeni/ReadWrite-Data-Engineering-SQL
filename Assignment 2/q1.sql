SELECT id, name, MAX(number_of_ratings) AS max_ratings
FROM brewies
GROUP BY 1,2
ORDER BY max_ratings DESC;
