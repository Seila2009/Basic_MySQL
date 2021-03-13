-- 1. 
UPDATE users SET created_at = NOW(), updated_at = NOW() WHERE created_at IS NULL OR updated_at IS NULL;

-- 2.
UPDATE users SET created_a = STR_TO_DATE(created_at, '%d.%m.%y %h:%i'), updated_at = STR_TO_DATE(updated_at, '%d.%m.%y %h:%i');

-- 3. 
SELECT * FROM storehouses_products;

INSERT INTO storehouses_products
	(storehouse_id, product_id, value, created_at, updated_at) VALUES
	(1, 1, 2, now(), now()),
	(2, 2, 1, now(), now()),
	(3, 3, 5, now(), now()),
	(4, 4, 0, now(), now()),
	(5, 5, 4, now(), now()),
	(6, 6, 3, now(), now());

SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN 9999999999999999999999 ELSE value END;

-- 4. (по желанию) 
SELECT * FROM users WHERE birthday_at RLIKE '^[0-9]{4}-(05|08)-[0-9]{2}';

-- 5. (по желанию)
SELECT *, FIELD(`id`, 5, 1, 2) FROM catalogs WHERE id IN (5, 1, 2);

-- 1. 
SELECT AVG(age) FROM (SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(birthday_at) as age FROM `users`) AS Avg_age;

-- второй вариант
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) FROM `users`;

-- 2.
SELECT 
    DAYNAME(CONCAT(YEAR(NOW()), '-', MONTH(birthday), '-', DAY(birthday))) AS day_name,
    COUNT(*)
FROM profiles
GROUP BY day_name
ORDER BY WEEKDAY(CONCAT(YEAR(NOW()), '-', MONTH(birthday), '-', DAY(birthday)))