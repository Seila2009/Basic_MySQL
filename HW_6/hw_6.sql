-- Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем
SELECT count(*) messages, friend FROM 
	(SELECT text, to_users_id AS friend FROM messages WHERE from_users_id = 1
	 UNION
	 SELECT text, from_users_id AS friend FROM messages WHERE to_users_id = 1) as history

GROUP BY friend ORDER BY messages DESC LIMIT 1;

-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
SELECT SUM(likes) 
FROM (SELECT COUNT(*) AS likes FROM likes, profiles WHERE users_id = profiles.users_id 
GROUP BY users_id ORDER BY profiles.birthday DESC LIMIT 10) as sumlikes;

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT COUNT(*) AS likes, gender FROM likes, profiles
WHERE likes.users_id = profiles.users_id
GROUP BY gender;

-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

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