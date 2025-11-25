DROP TABLE IF EXISTS summary_books;

CREATE TABLE summary_books AS
SELECT
    year AS publication_year,
    COUNT(*) AS book_count,
    ROUND(AVG(
        CASE
            WHEN price_raw LIKE '%$%' THEN CAST(SUBSTRING(price_raw FROM 2) AS NUMERIC)
            WHEN price_raw LIKE '%€%' THEN CAST(SUBSTRING(price_raw FROM 2) AS NUMERIC) * 1.2
        END
    ), 2) AS average_price_usd
FROM books
GROUP BY year
ORDER BY year;
