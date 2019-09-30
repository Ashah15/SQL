-- 1) List the films where the yr is 1962 [Show id, title]

-- answer:
SELECT id, title
FROM movie
WHERE yr=1962

-- 2) Give year of 'Citizen Kane'.

-- answer:
SELECT yr FROM
movie WHERE title = 'Citizen Kane';

-- 3) List all of the Star Trek movies, include the id, 
--    title and yr (all of these movies include the words Star Trek in the title). Order results by year.

-- answer:
SELECT id, title, yr FROM movie
WHERE title LIKE ('Star Trek%')
ORDER BY yr;

-- 4) What id number does the actor 'Glenn Close' have?

-- answer:
SELECT id FROM actor
WHERE name = 'Glenn Close';

-- 5) What is the id of the film 'Casablanca'

-- answer:
SELECT id FROM movie
WHERE title = 'Casablanca';

-- 6) Obtain the cast list for 'Casablanca'.

-- answer:
SELECT DISTINCT name FROM actor JOIN casting ON
actor.id = casting.actorid
WHERE movieid = 11768;

-- 7) Obtain the cast list for the film 'Alien'

-- answer:
SELECT name FROM actor 
JOIN casting ON
actor.id = casting.actorid
JOIN movie ON
movie.id = casting.movieid
WHERE title = 'Alien';

-- 8) List the films in which 'Harrison Ford' has appeared

-- answer:
SELECT title FROM actor 
JOIN casting ON
actor.id = casting.actorid
JOIN movie ON
movie.id = casting.movieid
WHERE actor.name = 'Harrison Ford';

-- 9) List the films where 'Harrison Ford' has appeared - but not in the starring role.

-- answer:
SELECT title FROM actor 
JOIN casting ON
actor.id = casting.actorid
JOIN movie ON
movie.id = casting.movieid
WHERE actor.name = 'Harrison Ford' AND ord != 1;

-- 10) List the films together with the leading star for all 1962 films.

-- answer:
SELECT title, name FROM movie 
JOIN casting ON
movie.id = casting.movieid
JOIN actor ON
actor.id = casting.actorid
WHERE yr = 1962 AND ord = 1;

-- 11) Which were the busiest years for 'Rock Hudson', show the year and the 
--     number of movies he made each year for any year in which he made more than 2 movies.

-- answer:
SELECT yr, COUNT(title) FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12) List the film title and the leading actor for all of the films 'Julie Andrews' played in.

-- answer:
SELECT DISTINCT title, name FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE movie.id IN (
SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews'))
AND ord = 1

-- 13) Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.

-- answer:
SELECT name FROM actor
JOIN casting ON actor.id = actorid
JOIN movie ON movie.id = movieid
WHERE ord = 1
GROUP BY name
HAVING COUNT(title) >= 30
ORDER BY name

-- 14) List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

-- answer:
SELECT title, COUNT(actorid) FROM movie 
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title

-- 15) List all the people who have worked with 'Art Garfunkel'.

-- answer:
SELECT DISTINCT name
FROM actor JOIN casting ON id=actorid
WHERE movieid IN (SELECT movieid FROM casting JOIN actor ON (actorid=id AND name='Art Garfunkel')) 
AND name != 'Art Garfunkel'
GROUP BY name

-----------------------------------------------------------------------------------------------------------------------
-- JOIN Quiz 2

-- 1) Select the statement which lists the unfortunate directors 
--    of the movies which have caused financial loses (gross < budget)

-- answer:
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

-- 2) Select the correct example of JOINing three tables

-- answer:
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

-- 3) Select the statement that shows the list of actors called 'John' 
--    by order of number of movies in which they acted

-- answer:
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

-- 4) Select the result that would be obtained from the following code:
        SELECT title 
        FROM movie JOIN casting ON (movieid=movie.id)
                    JOIN actor   ON (actorid=actor.id)
        WHERE name='Paul Hogan' AND ord = 1

-- answer:
/* Table-B
"Crocodile" Dundee
Crocodile Dundee in Los Angeles
Flipper
Lightning Jack */

-- 5) Select the statement that lists all the actors that starred in movies 
--    directed by Ridley Scott who has id 351

-- answer:
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

-- 6) There are two sensible ways to connect movie and actor. They are:

-- answer:
-- link the director column in movies with the primary key in actor
-- connect the primary keys of movie and actor via the casting table

-- 7) Select the result that would be obtained from the following code:
        SELECT title, yr 
        FROM movie, casting, actor 
        WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3

-- answer:

/* Table-B
A Bronx Tale  1993
Bang the Drum Slowly  1973
Limitless 2011 */