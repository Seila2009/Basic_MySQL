-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 SELECT name FROM users WHERE id IN (SELECT user_id FROM orders);

-- Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT products.name AS product_name, catalogs.name AS product_type 
  FROM products 
  LEFT JOIN catalogs 
    ON products.catalog_id = catalogs.id;

-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.