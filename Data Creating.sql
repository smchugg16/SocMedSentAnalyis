SELECT * FROM negative$
ORDER BY FREQUENCY desc

SELECT * FROM neutral$
ORDER BY FREQUENCY desc

SELECT * FROM positive$
ORDER BY FREQUENCY desc


SELECT WORD, FREQUENCY, SENTIMENT, CATEGORY
FROM positive$

UNION ALL

SELECT WORD, FREQUENCY, SENTIMENT, CATEGORY
FROM negative$

UNION ALL

SELECT WORD, FREQUENCY, SENTIMENT, CATEGORY
FROM neutral$
ORDER BY FREQUENCY desc;