-- создание таблицы
CREATE TABLE movie.content_genres (
	movieId int,
	genre text
);

-- заливка данных в таблицу
psql -U postgres -h localhost -p 5433 -c "\\copy movie.content_genres  FROM 'data_management/data_store/raw_data/genres.csv' DELIMITER ',' CSV HEADER"

-- запрос 3
WITH top_rated as (
	SELECT 
		movieId, 
		AVG(rating) as avg_rating
	FROM movie.ratings
	GROUP BY movieId
	HAVING COUNT(userId) > 50
	ORDER BY avg_rating DESC, movieId ASC
	LIMIT 150
	)
SELECT 
	r.movieId, 
	r.avg_rating, 
	g.keywords 
INTO movie.top_rating_with_keywords
FROM top_rated r
JOIN (
	SELECT 
		movieId, 
		array_agg(genre) AS keywords
from movie.content_genres
group by movieid 
) g
ON r.movieId = g.movieId;

-- выгрузка таблицы в файл
psql -U postgres -h localhost -p 5433 -c "\\copy (SELECT * FROM movie.top_rating_with_keywords LIMIT 100) TO 'data_management/data_store/raw_data/top_rating_with_keywords.csv' WITH CSV HEADER DELIMITER as E'\t';"
