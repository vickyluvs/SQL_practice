--Here I query the top 25 schools with .edu domains--
SELECT * 
 FROM users
 WHERE email_domain LIKE '%edu%'
 LIMIT 25;


-- Here I query how many learners with .edu domains are located in New York--
 SELECT COUNT (*)
 FROM users
 WHERE email_domain LIKE '%edu%'
 AND city = 'New York';


 --Here I query how many mobile_app user are not null--
 SELECT *
 FROM users
 WHERE mobile_app IS NOT NULL
 LIMIT 200;

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
 SELECT u_id.email_domain, p_id.learn_cpp, p_id.learn_sql, p_id.learn_html, p_id.learn_javascript, p_id.learn_java
 FROM users u_id
 LEFT JOIN progress p_id
 ON u_id.user_id = p_id.user_id
 GROUP BY 1
 ORDER BY 1
   LIMIT 50;

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



