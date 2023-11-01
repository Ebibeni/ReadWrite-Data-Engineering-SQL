SELECT id, name, longitude, latitude,
    ( 3959 * acos( cos( radians(44.0575649) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians(-121.3288021) ) + sin( radians(44.0575649) ) * sin( radians( latitude ) ) ) ) AS distance
FROM brewies
ORDER BY distance
LIMIT 1;
