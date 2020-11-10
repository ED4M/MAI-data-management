SELECT 'FIO: Tokarev Sergey Konstantinovich';

SELECT 
	userId, 
	movieId, 
	(rating - MIN(rating) OVER (PARTITION BY userId) / (MAX(rating) OVER (PARTITION BY userId) -  MIN(rating) OVER (PARTITION BY userId)),
	AVG(rating) OVER (PARTITION BY userId) 
FROM movie.ratings
LIMIT 30;
