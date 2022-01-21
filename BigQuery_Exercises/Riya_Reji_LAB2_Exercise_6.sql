-- Exercise n. 6
-- Find the top 10 StackOverflow users (the id) by accepted responses on 2010 posts
-- Public Dataset: bigquery-public-data.stackoverflow
-- Table involved: stackoverflow_posts, posts_answers, users



SELECT 
u.id AS id_user,
COUNT(postAns.owner_user_id) AS count 
FROM 
`bigquery-public-data.stackoverflow.users` u
INNER JOIN
`bigquery-public-data.stackoverflow.posts_answers` postAns
ON u.id=postAns.owner_user_id
INNER JOIN
`bigquery-public-data.stackoverflow.stackoverflow_posts` stackp
ON 
stackp.accepted_answer_id=postAns.id
WHERE stackp.accepted_answer_id IS NOT NULL AND EXTRACT(YEAR FROM stackp.creation_date)=2010
GROUP BY id_user
ORDER BY count DESC
LIMIT 10