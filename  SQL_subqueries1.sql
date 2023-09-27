-- 1
SELECT COUNT(*) AS Copies
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
WHERE film.title = 'Hunchback Impossible';

-- 2
    SELECT title FROM film
WHERE
    length > (SELECT AVG(length) FROM film);
    
-- 3
   SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Alone Trip';

 -- 4
SELECT title
FROM film
WHERE film_id IN (
    SELECT film_id
    FROM film_category
    WHERE category_id = (
        SELECT category_id
        FROM category
        WHERE name = 'Family'
    )
);

 -- 5
SELECT c.first_name, c.last_name, c.email
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Canada';    
-- 6
SELECT
    film.title FROM film
JOIN (
    SELECT
        film_actor.actor_id,
        COUNT(*) AS film_count
    FROM
        film_actor
    GROUP BY
        film_actor.actor_id
    ORDER BY
        film_count DESC
    LIMIT 1
) AS prolific_actor ON film.film_id IN (
    SELECT
        film_id
    FROM
        film_actor
    WHERE
        actor_id = prolific_actor.actor_id
);    

-- 7
SELECT
    film.title
FROM
    film
JOIN (
    SELECT
        film_actor.actor_id,
        COUNT(*) AS film_count
    FROM
        film_actor
    GROUP BY
        film_actor.actor_id
    ORDER BY
        film_count DESC
    LIMIT 1
) AS prolific_actor ON film.film_id IN (
    SELECT
        film_id
    FROM
        film_actor
    WHERE
        actor_id = prolific_actor.actor_id
);

-- 8
SELECT
    film.title
FROM
    film
JOIN (
    SELECT
        film_actor.actor_id,
        COUNT(*) AS film_count
    FROM
        film_actor
    GROUP BY
        film_actor.actor_id
    ORDER BY
        film_count DESC
    LIMIT 1
) AS prolific_actor ON film.film_id IN (
    SELECT
        film_id
    FROM
        film_actor
    WHERE
        actor_id = prolific_actor.actor_id
);
    
    
    
    
    