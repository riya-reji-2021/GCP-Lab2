-- Exercise n. 8
-- Find the top 10 committers in 2016 on Github repositories that uses the Java language
-- Public Dataset: bigquery-public-data.github_repos
-- Tables involved: languages, sample_commits



SELECT 
cmt.committer.name AS name,
COUNT(cmt.committer.name) AS count 
FROM `bigquery-public-data.github_repos.sample_commits` cmt
JOIN
`bigquery-public-data.github_repos.languages` lang
ON cmt.repo_name=lang.repo_name,
UNNEST (language) AS l
WHERE l.name="Java" AND EXTRACT(YEAR FROM cmt.committer.date)=2016
GROUP BY name
ORDER BY count DESC 
LIMIT 10