-- To obtain my top 20 most streamed artists, I performed the same queries in '1&2Combined_Queries'. The only change is, instead of 'trackName' it is 'artistName'.
-- That said, below I have provided my final query to obtain my top 20 artist if interested. 

WITH dupes AS (
  SELECT  
artists,
totalsum
FROM finalspot.combined1
UNION ALL
  SELECT 
artists,
totalsum
FROM finalspot.combined2
)

SELECT 
artists,
CASE WHEN COUNT(artists) > 1 THEN ROUND(SUM(totalsum / 60000) / 60, 1) END AS hours,
FROM dupes
GROUP BY artists
ORDER BY hours DESC