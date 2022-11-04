-- Here, I specify 'Kendrick Lamar' and playtime that exceeds 30 seconds, to obtain tracks I streamed from May 5th to September 9th
-- The difference in this combination query is I included the date column

WITH dupes AS (
  SELECT  
artistName,
totalsum,
trackName,
date
FROM finalspot.combined1
UNION ALL
  SELECT 
artistName,
totalsum,
trackName,
date
FROM finalspot.combined2
)

SELECT
date, 
artistName AS artist,
trackName,
totalsum
FROM dupes
WHERE artistName = "Kendrick Lamar" AND totalsum > 30000 AND date BETWEEN "2022-05-13" AND "2022-09-09"
ORDER BY totalsum DESC


-- Here, I convert the milliseconds to minutes to later graph this data easier in Tableau
-- This was the final query performed and the only one on my last table 'kendrick'


SELECT 
date,
trackName AS tracks,
ROUND(totalsum / 60000, 1) AS minutes,
FROM finalspot.kendrick
WHERE date BETWEEN "2022-05-13" AND "2022-09-09"
ORDER BY minutes DESC