-- Просматриваем таблицу
select * from users;

-- Обновляем поля created_at и updated_at текущими датой и временем
update users set created_at = now(), updated_at = now();