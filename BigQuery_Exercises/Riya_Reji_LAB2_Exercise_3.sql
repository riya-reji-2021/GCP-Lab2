-- Exercise n. 3
-- Find how many times a page it was visited in July 2017. Group by date the result
-- Public Dataset: bigquery-public-data.google_analytics_sample
-- Table involved: ga_sessions_201707* (wildcard)



SELECT
 PARSE_DATE("%Y%m%d", date) AS date,
  ht.page.pagePath AS pagePath,
  COUNT(ht.page.pagePath) AS counter,
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
  UNNEST (hits) AS ht
  GROUP BY date,pagePath
  ORDER BY date,counter DESC