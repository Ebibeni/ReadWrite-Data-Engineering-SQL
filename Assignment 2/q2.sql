SELECT brewery_type, AVG(rating) AS average_rating
FROM brewies
GROUP BY brewery_type;
