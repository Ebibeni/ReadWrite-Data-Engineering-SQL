WITH RankedChannels AS (
    SELECT
        YEAR(p.PURCHASE_DATE) AS Year,
        s.CHANNEL,
        SUM(p.UNIT_VALUE_POUNDS * p.UNITS) AS TotalRevenue,
        RANK() OVER (PARTITION BY YEAR(p.PURCHASE_DATE) ORDER BY SUM(p.UNIT_VALUE_POUNDS * p.UNITS) DESC) AS Ranked
    FROM PURCHASES_1 p
    INNER JOIN SESSIONS s ON p.PURCHASE_ID = s.PURCHASE_ID
    GROUP BY Year, s.CHANNEL
)
SELECT Year, CHANNEL, TotalRevenue
FROM RankedChannels
WHERE Ranked = 2;