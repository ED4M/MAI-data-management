SELECT 'FIO: Tokarev Sergey Konstantinovich';

-- первый запрос
SELECT * FROM movie.ratings LIMIT 10;

-- второй запрос
SELECT * FROM movie.links WHERE imdbid LIKE '%42' AND movieid BETWEEN 100 AND 1000 LIMIT 10;

-- третий запрос
SELECT imdbid 
FROM movie.links
JOIN movie.ratings 
	ON links.movieid = ratings.movieid
WHERE rating = 5 LIMIT 10;

-- четвёртый запрос
SELECT COUNT(DISTINCT(links.movieid))
FROM movie.links
LEFT JOIN movie.ratings 
	ON links.movieid = ratings.movieid
WHERE rating IS NULL
LIMIT 10;

-- пятый запрос
SELECT userid
FROM movie.ratings
GROUP BY userid
HAVING AVG(rating) > 3.5
LIMIT 10;

-- шестой запрос
SELECT imdbid 
FROM movie.links 
WHERE movieid IN (
	SELECT movieid
	FROM movie.ratings
	GROUP BY movieid
	HAVING AVG(rating) > 3.5
) LIMIT 10;

-- седьмой запрос
WITH avg_user_rating 
AS 
	(
	SELECT userid, 
	 	avg(rating) AS user_rating 
	 FROM movie.ratings 
	 GROUP BY userid 
	 HAVING count(rating) > 10
	) 
	 SELECT avg(user_rating) FROM avg_user_rating;
