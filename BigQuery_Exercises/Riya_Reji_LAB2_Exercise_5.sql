-- Exercise n. 5
-- Find the top 10 users (the id) who answered the most questions.
-- Public Dataset: bigquery-public-data.stackoverflow
-- Table involved: posts_answers, users



SELECT 
users.id AS id_user, 
COUNT (postsAns.owner_user_id) AS count
FROM `bigquery-public-data.stackoverflow.users` users 
JOIN 
`bigquery-public-data.stackoverflow.posts_answers` postsAns 
ON users.id=postsAns.owner_user_id
WHERE EXTRACT(YEAR FROM postsAns.creation_date)= 2010
GROUP BY id_user 
ORDER BY count DESC 
LIMIT 10