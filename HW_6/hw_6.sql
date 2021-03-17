-- Задача 1.
SELECT count(*) messages, friend FROM 
	(SELECT text, to_users_id AS friend FROM messages WHERE from_users_id = 1
	 UNION
	 SELECT text, from_users_id AS friend FROM messages WHERE to_users_id = 1) as history

GROUP BY friend ORDER BY messages DESC LIMIT 1;

-- Задача 2.
SELECT 
	SUM(likes) 
FROM (SELECT 
			COUNT(*) AS likes
	  FROM likes, profiles
	  WHERE likes.users_id = profiles.users_id
	  GROUP BY likes.users_id
	  ORDER BY profiles.birthday DESC
	  LIMIT 10) as countlikes

-- Задача 3.
SELECT COUNT(*) AS likes, gender FROM likes, profiles
WHERE likes.users_id = profiles.users_id
GROUP BY gender;

-- Задача 4.

SELECT users_id, COUNT(*) AS summ_likes
FROM likes
GROUP BY users_id
ORDER BY summ_likes LIMIT 10;

SELECT users_id, COUNT(*) AS summ_media
FROM media
GROUP BY users_id
ORDER BY summ_media LIMIT 10;

SELECT from_users_id, COUNT(*) AS summ_messages
FROM messages
GROUP BY from_users_id
ORDER BY summ_messages LIMIT 10;