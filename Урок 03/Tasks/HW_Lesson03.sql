-- Задание 1.
-- Просматриваем таблицу
 SELECT
	*
FROM
	users;
-- Обновляем поля created_at и updated_at текущими датой и временем
 UPDATE
	users
SET
	created_at = NOW(),
	updated_at = NOW();

-- Задание 2.
-- Изменяем существующую таблицу с условиями задания
ALTER TABLE shop.users MODIFY COLUMN created_at VARCHAR(255);

ALTER TABLE shop.users MODIFY COLUMN updated_at VARCHAR(255);
-- Приводим существующие данные к условию задания. Игнорируем уникальность и эмуляцию прочего поведения реального ЖЦ БД
 UPDATE
	users
SET
	created_at = '20.10.2017 8:10',
	updated_at = '20.10.2017 8:10';
-- Убедимся, что таблица соответствует условиям задачи
 DESCRIBE users;
-- Привидем строковую дату к виду, допустимому для преобразования строкового поля к типу DATETIME
 UPDATE
	users
SET
	created_at = STR_TO_DATE(created_at,
	"%d.%m.%Y %k:%i"),
	updated_at = STR_TO_DATE(updated_at,
	"%d.%m.%Y %k:%i");
-- Выполним операцию изменения типов полей created_at и updated_at на тип DATETIME
ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users CHANGE updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Проверим результат
 DESCRIBE users;

-- Задание 3.
 SELECT
	*
FROM
	storehouses_products
ORDER BY
	IF(value > 0,
	0,
	1),
	value ASC;

-- Задание 4.
 SELECT
	name,
	birthday_at,
	CASE
		WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'May'
		WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'August'
	END AS month
FROM
	users
WHERE
	DATE_FORMAT(birthday_at, '%m') = 05
	OR DATE_FORMAT(birthday_at, '%m') = 08;

-- Задание 5.
 SELECT
	*
FROM
	catalogs c
WHERE
	id IN (5, 1, 2)
ORDER BY
	FIELD(id, 5, 1, 2) ;
