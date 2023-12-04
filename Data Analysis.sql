
/*
Most Occuring Words
*/
SELECT TOP 200
    Word,
    SUM(Frequency) AS TotalFrequency
FROM
    CombinedSentimentTable
GROUP BY
    Word
ORDER BY
    TotalFrequency DESC;


--Creating a new Sentiment Score of positive/negative--
SELECT TOP 200
    Word,
    SUM(Frequency * CASE WHEN Category = 'Positive' THEN 1 WHEN Category = 'Negative' THEN -1 ELSE 0 END) AS CustomSentimentScore
FROM
    CombinedSentimentTable
GROUP BY
    Word
ORDER BY
    ABS(SUM(Frequency * CASE WHEN Category = 'Positive' THEN 1 WHEN Category = 'Negative' THEN -1 ELSE 0 END)) DESC;


--Sentiments of most popular words--
SELECT TOP 200
    Word,
    SUM(Frequency * CASE WHEN Category = 'Positive' THEN 1 WHEN Category = 'Negative' THEN -1 ELSE 0 END) AS CustomSentimentScore,
	SUM(Frequency) AS TotalFrequency
FROM
    CombinedSentimentTable
GROUP BY
    Word
ORDER BY
	TotalFrequency DESC;


/*
*/
SELECT
    Category,
    COUNT(*) AS Frequency
FROM
    CombinedSentimentTable
GROUP BY
    Category;

