SELECT name, year FROM movies WHERE year=1902 AND rank > 5; 


____
CAR

SELECT name FROM movies WHERE name LIKE 'Car %';

Birth Year

SELECT name, year FROM movies WHERE year = 1985 OR year = 1993;

1982 /* Number of movies from 1982 is 4597 */

SELECT year, COUNT(*) AS num_of_movies FROM movies WHERE year = 1982;

Stacktors /*searches are not case sensitive*/

SELECT first_name, last_name FROM actors WHERE last_name LIKE '%Stack%';

Fame Name Game
/*
John        4371
Michael     3997
David       3843
Robert      3376
Peter       3066

Smith       2425
Lee         1878
Williams    1753
Jones       1727
Johnson     1634
*/

SELECT first_name, COUNT(*) AS number_of_actors FROM actors 
GROUP BY first_name ORDER BY number_of_actors DESC 
LIMIT 5;

SELECT last_name, COUNT(*) AS number_of_actors FROM actors 
GROUP BY last_name ORDER BY number_of_actors DESC 
LIMIT 5;

Prolific

/********
	When you only have two tables with overlapping fields. 
	Pick one table to be the From table and the other to be the Inner Join Table.
	Then see below:

********/

SELECT actors.first_name, actors.last_name, COUNT(*) as num_roles
FROM actors
INNER JOIN roles
ON roles.actor_id=actors.id
GROUP BY actors.id 
ORDER BY num_roles DESC
LIMIT 5;

Bottom of the Barrel

SELECT genre, COUNT(*) as num_of_movies
FROM movies_genres 
GROUP BY genre 
ORDER BY num_of_movies
LIMIT 10;


Braveheart
students=actors, schools=movies, enrollment=roles

SELECT actors.first_name, actors.last_name
FROM actors 
	INNER JOIN roles 
	ON actors.id=roles.actor_id
	INNER JOIN movies
	ON roles.movie_id=movies.id
WHERE movies.name="Braveheart" AND movies.year=1995
ORDER BY actors.last_name; 

Leap Noir
students=movie_directors, enrollment=movies, schools=genres

SELECT directors.first_name, directors.last_name, movies.name, movies.year
FROM directors
	INNER JOIN movies_directors
	ON directors.id=movies_directors.director_id
	INNER JOIN movies 
	ON movies_directors.movie_id=movies.id
	INNER JOIN movies_genres
	ON movies.id=movies_genres.movie_id
WHERE movies.year%4=0 AND movies_genres.genre='Film-Noir'
LIMIT 10;

Degree of Bacon

/*SELECT actors.first_name, actors.last_name, movies.name, movies_genres.genre */

SELECT roles.actor_id, movies.name, movies_genres.genre 
FROM actors AS bacon_dramas
	INNER JOIN roles AS bacon_roles
	ON bacon_dramas.id = roles.actor_id
	INNER JOIN movies
	ON bacon_roles.movie_id = movies.id 
	INNER JOIN movies_genres 
	ON movies.id = movies_genres.movie_id
	INNER JOIN roles
	on bacon_roles.movie_id=roles.movie_id
WHERE bacon_dramas.first_name = "Kevin" AND bacon_dramas.last_name = "Bacon" AND movies_genres.genre = 'Drama';

CREATE TABLE bacon_dramas(
	id INTEGER
)

SELECT movies.id AS id
FROM actors
	INNER JOIN roles
	on actors.id=roles.actor_id
	INNER JOIN movies
	ON roles.movie_id = movies.id 
	INNER JOIN movies_genres 
	ON movies.id = movies_genres.movie_id
WHERE actors.first_name = 'Kevin' AND actors.last_name = 'Bacon' AND movies_genres.genre = 'Drama'




/*SELECT movies.name, actors.first_name, actors.last_name*/
SELECT movies.name, actors.first_name,actors.last_name
FROM movies
	INNER JOIN (
		SELECT movies.id AS id
		FROM actors
			INNER JOIN roles
			on actors.id=roles.actor_id
			INNER JOIN movies
			ON roles.movie_id = movies.id 
			INNER JOIN movies_genres 
			ON movies.id = movies_genres.movie_id
		WHERE actors.first_name = 'Kevin' AND actors.last_name = 'Bacon' AND movies_genres.genre = 'Drama'
		) AS bacon_dramas
	ON movies.id=bacon_dramas.id
	INNER JOIN roles 
	ON roles.movie_id=bacon_dramas.id
	INNER JOIN actors
	ON actors.id=roles.actor_id
WHERE NOT(actors.first_name='Kevin' AND actors.last_name = 'Bacon' )
ORDER BY movies.name
LIMIT 20;
















	ON roles.movie_id = bacon_dramas.id 
	INNER JOIN movies
	ON movies.id = bacon_dramas.id
	INNER JOIN actors
	ON roles.actor_id = actors.id 
WHERE NOT (actors.first_name = 'kevin' AND actors.last_name='bacon');
	





