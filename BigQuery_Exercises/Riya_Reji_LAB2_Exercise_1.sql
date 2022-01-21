-- Exercise n1.
-- Given the shared file top_4000_movies_data.csv
-- 1. Create a BigQuery table “Movie”
-- 2. Find the top 10 highest budget films, year by year, from 2016 to 2020.



WITH m AS
(
SELECT 
EXTRACT(YEAR FROM Release_Date) as year,
Movie_Title,
Production_Budget,
RANK() OVER(PARTITION BY EXTRACT(YEAR FROM Release_Date) ORDER BY Production_Budget DESC) AS rank
FROM `nttdata-c4e-bde.uc1_6.Movie` 
WHERE Release_Date BETWEEN '2016-01-01' AND '2020-12-31'
)

SELECT year,Movie_Title,Production_Budget,rank
FROM m
WHERE rank BETWEEN 1 AND 10
ORDER BY year DESC