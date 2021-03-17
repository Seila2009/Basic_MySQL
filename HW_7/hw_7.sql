-- Задание 1.
SELECT name FROM users WHERE id IN (SELECT user_id FROM orders);

-- Задание 2.
SELECT products.name AS product_name, catalogs.name AS product_type 
  FROM products 
  LEFT JOIN catalogs 
    ON products.catalog_id = catalogs.id;

-- (по желанию) Задание 3.

CREATE DATABASE IF NOT EXISTS flights_cities;

USE flights_cities;

DROP TABLE IF EXISTS flights;
CREATE TABLE IF NOT EXISTS flights (
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(255) COMMENT 'Город отправления',
	`to` VARCHAR(255) COMMENT 'Город прибытия'
) COMMENT = 'Рейсы';

INSERT INTO flights (`from`, `to`) VALUES
	('moscow', 'omsk'),
	('nowgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');
	
DROP TABLE IF EXISTS cities;
CREATE TABLE IF NOT EXISTS cities (
	id SERIAL PRIMARY KEY,
	label VARCHAR(255) COMMENT 'Код города',
	name VARCHAR(255) COMMENT 'Название города'
) COMMENT = 'Словарь городов';

INSERT INTO cities (label, name) VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('nowgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');
	
SELECT
	id,
	(SELECT name FROM cities WHERE label = flights.from) AS `from`,
	(SELECT name FROM cities WHERE label = flights.to) AS `to`
FROM
	flights;