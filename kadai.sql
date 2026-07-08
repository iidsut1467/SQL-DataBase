1
SELECT first_name AND last_name FROM users;

2
SELECT * FROM tweets JOIN users ON users.first_name = "John" AND users.last_name = "Doe"

3
SELECT * FROM twitter.users JOIN twitter.replys WHERE user_id BETWEEN '1' AND '10';

4
SELECT COUNT('tweet') FROM tweets JOIN users ON first_name = "Chalie" AND last_name = "Brown";

5
SELECT 
  t.id AS tweet_id, 
  u.first_name, 
  u.last_name, 
  t.tweet, 
  COUNT(r.id) AS reply_count
FROM tweets
JOIN users ON t.user_id = u.id
LEFT JOIN replys r ON t.id = r.tweet_id
GROUP BY t.id
ORDER BY reply_count;

6
SELECT COUNT(*) AS カウント FROM(SELECT user_id FROM tweets UNION ALL SELECT user_id FROM replys)a GROUP BY user_id ORDER BY カウント DESC LIMIT 1

7
SELECT t.tweet, r.reply FROM tweets t LEFT JOIN replys r ON t.id = r.tweet_id;

9
SELECT u.id, u.first_name, u.last_name, COUNT(DISTINCT t.id), COUNT(DISTINCT r.id) FROM users u LEFT JOIN tweets t ON u.id = t.user_id LEFT JOIN replys r ON u.id = r.user_id GROUP BY u.id, u.first_name, u.last_name;

SELECT u.first_name, u.last_name FROM users u JOIN replys r ON u.id = r.user_id GROUP BY u.id, u.first_name, u.last_name;
10
SELECT t.tweet,u.first_name,u.last_name,NULL FROM tweets t JOIN users u ON t.user_id=u.id UNION SELECT r.reply,u.first_name,u.last_name,t.tweet FROM replys r JOIN users u ON r.user_id=u.id LEFT JOIN tweets t ON r.tweet_id=t.id ORDER BY 4;