WITH PageViewsWithLeadLag AS (
    SELECT
        PAGE_VIEW_ID,
        PAGE_URL,
        LAG(PAGE_URL) OVER (PARTITION BY USER_ID ORDER BY PAGE_VIEW_TIMESTAMP) AS PreviousPage
    FROM PAGE_VIEWS
)
SELECT
    SUM(CASE WHEN PreviousPage LIKE '%/product/%' AND PAGE_URL LIKE '%/cart' THEN 1 ELSE 0 END) AS ProductToCartViews,
    COUNT(*) AS TotalProductViews
FROM PageViewsWithLeadLag
WHERE PreviousPage IS NOT NULL;
