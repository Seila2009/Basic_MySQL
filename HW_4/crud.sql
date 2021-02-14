USE vk_new;

DELETE FROM school_types;

INSERT school_types VALUES
(1, 'h', 'school №3', 'Omsk'),
(2, 'c', 'college №67', 'Tomsk'),
(3, 'u', 'MTI', 'Moscow');

INSERT `school_types` (`profiles_users_id`, `types`, `name`, `city`) VALUES
(4, 'h', 'high school №1295', 'Orel'),
(5, 'c', 'tech college №33', 'Rostov-na-Donu');

INSERT IGNORE `school_types` (`profiles_users_id`, `types`, `name`, `city`) VALUES
(9, 'u', 'MSU', 'Moscow'),
(5, 'c', 'tech college №33', 'Perm');

INSERT `vk_new`.`school_types` (`profiles_users_id`, `city`)
SELECT 24, `Name` FROM world.city WHERE  ID = 6;

INSERT `school_types` SET
	`profiles_users_id` = 15,
    `types` = 'c',
    `name` = 'tech college №1585',
    `city` = 'Moscow';	
    
UPDATE school_types SET 
	`name` = 'high school №36'
WHERE `profiles_users_id` = 1;

SELECT * FROM vk_new.school_types;
SELECT profiles_users_id, `types` institute_types, `name` AS school_name, city FROM  vk_new.school_types WHERE profiles_users_id <= 20; 