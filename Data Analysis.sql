
--- Retrieve the top 200 most occurring words and the number of occurences as 'TotalFrequency' from the CombinedSentimentTable ---
SELECT TOP 200
    Word,
    SUM(Frequency) AS TotalFrequency
FROM
    SocMedia.dbo.CombinedSentimentTable
GROUP BY
    Word
ORDER BY
    TotalFrequency DESC;


--- Creating a new Sentiment Score based on positive and negative categories, then selecting the Absolute Value of these scores to find the Top 200 strongest sentiments ---
SELECT TOP 200
    Word,
    SUM(Frequency * CASE WHEN Category = 'Positive' THEN 1 WHEN Category = 'Negative' THEN -1 ELSE 0 END) AS CustomSentimentScore
FROM
    SocMedia.dbo.CombinedSentimentTable
GROUP BY
    Word
ORDER BY
    ABS(SUM(Frequency * CASE WHEN Category = 'Positive' THEN 1 WHEN Category = 'Negative' THEN -1 ELSE 0 END)) DESC;



--- Calculate new sentiment scores (same as above) for the top 200 most popular words ---
SELECT TOP 200
    Word,
    SUM(Frequency * CASE WHEN Category = 'Positive' THEN 1 WHEN Category = 'Negative' THEN -1 ELSE 0 END) AS CustomSentimentScore,
	SUM(Frequency) AS TotalFrequency
FROM
    SocMedia.dbo.CombinedSentimentTable
GROUP BY
    Word
ORDER BY
	TotalFrequency DESC;


--- Count the occurrences of each sentiment category (positive/negative/neutral) in the CombinedSentimentTable ---
SELECT
    Category,
    COUNT(*) AS Frequency
FROM
    SocMedia.dbo.CombinedSentimentTable
GROUP BY
    Category;

