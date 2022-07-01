--Here I query the top 25 schools with .edu domains--
SELECT email_domain AS top_25_school, COUNT(*) AS enrolled_numbers
FROM users
WHERE email_domain LIKE "%.edu"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 25;


-- Here I query how many learners with .edu domains are located in New York--
 SELECT COUNT(*) AS new_york_learners
FROM users
WHERE email_domain LIKE "%.edu" AND city = "New York";

 --Here I query how many mobile_app user are not null--
 SELECT COUNT(*) AS mobile_app_learners
FROM users 
WHERE mobile_app IS NOT NULL;
-- Here I used the strftime() to query for the signup counts for each hour--
 SELECT sign_up_at,
    strftime('%H', sign_up_at)
 FROM users
 GROUP BY 1
 LIMIT 200;

-- 4 Here I joined the two tables and limit it to 50---
 SELECT *
 FROM users
 LEFT JOIN progress
    ON users.user_id = progress.user_id
       LIMIT 20;

-- Here I find our if  different schools .edu domains prefer different courses?--
 SELECT users.email_domain,
  COUNT(CASE
        WHEN progress.learn_cpp = 'completed'
          OR progress.learn_cpp = 'started' THEN '1'
        END) AS 'cpp',
  COUNT(CASE
        WHEN progress.learn_sql = 'completed'
          OR progress.learn_sql = 'started' THEN '1'
        END) AS 'sql',
  COUNT(CASE
        WHEN progress.learn_html = 'completed'
          OR progress.learn_html = 'started' THEN '1'
        END) AS 'html',
  COUNT(CASE
        WHEN progress.learn_javascript = 'completed'
          OR progress.learn_javascript = 'started' THEN '1'
        END) AS 'js',
  COUNT(CASE
        WHEN progress.learn_java = 'completed'
          OR progress.learn_java = 'started' THEN '1'
        END) AS 'java'
FROM users
LEFT JOIN progress
  ON users.user_id = progress.user_id
GROUP BY 1;

--What courses are the New Yorkers students taking?--
   SELECT *
 FROM users
 LEFT JOIN progress
    ON users.user_id = progress.user_id
 WHERE city = 'New York'
  LIMIT 10;

 

-- --What courses are the Chicago students taking?--
  SELECT *
 FROM users
 LEFT JOIN progress
   ON users.user_id = progress.user_id
 WHERE city = 'Chicago'
  LIMIT 10;



