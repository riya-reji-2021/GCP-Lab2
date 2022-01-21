-- Exercise n. 2
-- Show a flat result of the pages visited on 1st August 2017
-- Public Dataset: bigquery-public-data.google_analytics_sample
-- Table involved: ga_sessions_20170801



SELECT
  visitId, 
  visitStartTime, 
  ht.page.pageTitle, 
  ht.page.pagePath,
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`,
  UNNEST (hits) AS ht

