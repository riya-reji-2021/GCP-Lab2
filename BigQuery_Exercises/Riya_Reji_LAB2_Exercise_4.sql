-- Exercise n. 4
-- 1. Find the first 3 most used pairs of OS and Browser from mobile devices for each 
-- available country on 1st August 2017
-- 2. Produce a new table with the query result
-- Public Dataset: bigquery-public-data.google_analytics_sample
-- Table involved: ga_sessions_20170801
-- Tip: ARRAY_AGG functions can be useful
-- (see: https://cloud.google.com/bigquery/docs/reference/standard-sql/aggregate_functions)




WITH mostUsed AS
(
SELECT geoNetwork.country AS country,
device.operatingSystem AS operatingSystem,
device.browser AS browser,
RANK() OVER(PARTITION BY geoNetwork.country ORDER BY (COUNT (device.browser)+COUNT(device.operatingSystem))) AS rank
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
WHERE 
device.isMobile= TRUE 
AND geoNetwork.country <> '(not set)' AND device.operatingSystem <> '(not set)' AND device.browser <> '(not set)'
GROUP BY country ,operatingSystem,browser 
ORDER BY country 
)
SELECT country , ARRAY_AGG(STRUCT(operatingSystem ,browser,rank)) AS country_rank
FROM mostUsed 
where rank<=3
GROUP BY country
ORDER BY country
