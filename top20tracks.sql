-- With my two combined datasets, I am able to create a new dataset ID, 'finalspot'.
-- Here, I combine these two datasets, each containing combined duplicates for their respective tables.
-- Ultimately, I do a final combination of duplicates and their respective playtimes, and convert them to hours to get my top 20 streamed tracks.

WITH dupes AS (
  SELECT 
tracks,
artists,
totalsum
FROM finalspot.combined1
UNION ALL
  SELECT 
tracks,
artists,
totalsum
FROM finalspot.combined2
)

SELECT 
CASE WHEN COUNT(tracks) > 1 THEN ROUND(SUM(totalsum / 60000) / 60, 1) END AS hours,
tracks,
artists
FROM dupes
GROUP BY tracks, artists
ORDER BY hours DESC
LIMIT 20