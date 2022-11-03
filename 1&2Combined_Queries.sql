-- First I combine my streaminghistory0 and streaminghistory1 table together using UNION ALL. Then, for all my duplicate tracks, I add their msPlayed by their trackName.
-- This query ultimately eliminates duplicates and finds my total playtime for specific tracks. This must be done as the spotify data adds a 'trackName' each time you 
-- stream it, making your data have many duplicates. The queries below are performed on seperate tabs.
-- Note, 'spotifyhistory' is my dataset ID.

WITH dupes AS (
  SELECT 
trackName, 
artistName,
msPlayed
FROM spotifyhistory.history0
UNION ALL
  SELECT 
trackName, 
artistName,
msPlayed
FROM spotifyhistory.history1
)

SELECT 
CASE WHEN COUNT(trackName) > 1 THEN SUM(msPlayed) END AS minutes,
trackName AS tracks,
artistName AS artists
FROM dupes
GROUP BY trackName, artistName
ORDER BY minutes DESC

-- Combining our last two datasets.

WITH dupes AS (
  SELECT 
trackName, 
artistName,
msPlayed
FROM spotifyhistory.history2
UNION ALL
  SELECT 
trackName, 
artistName,
msPlayed
FROM spotifyhistory.history3
)

SELECT 
CASE WHEN COUNT(trackName) > 1 THEN SUM(msPlayed) END AS minutes,
trackName AS tracks,
artistName AS artists
FROM dupes
GROUP BY trackName, artistName
ORDER BY minutes desc
