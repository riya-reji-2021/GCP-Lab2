-- Exercise n. 7
-- Find the most popular programming language
-- Public Dataset: bigquery-public-data.github_repos
-- Table involved: languages



SELECT
  lang.name AS language_name,
  COUNT(lang.name) AS count
FROM
  `bigquery-public-data.github_repos.languages`,
  UNNEST (language) AS lang
GROUP BY
  lang.name
ORDER BY
  count DESC
LIMIT
  1