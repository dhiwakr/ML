
CREATE VIEW vw_actorpair2 AS

SELECT
    ac.actor_id AS id1,
    CONCAT(ac.first_name, ' ', ac.last_name) AS first_actor, 
    ac2.actor_id AS id2,    
    CONCAT(ac2.first_name, ' ', ac2.last_name) AS second_actor,
    COUNT(f.title)
   
FROM
    film_actor fa
    INNER JOIN actor ac ON fa.actor_id = ac.actor_id
    INNER JOIN film f ON f.film_id = fa.film_id
    INNER JOIN film_actor fa2 ON fa2.film_id = fa.film_id
    INNER JOIN actor ac2 ON (fa2.actor_id = ac2.actor_id AND fa.actor_id < fa2.actor_id)
    
GROUP BY first_actor, second_actor, id1, id2
ORDER BY COUNT(f.title) DESC
LIMIT 1;



SELECT v.first_actor, v.second_actor, f.title
FROM  vw_actorpair2 v
      INNER JOIN film_actor fa ON v.id1 = fa.actor_id 
      INNER JOIN film_actor fa2 ON v.id2 = fa2.actor_id
      INNER JOIN film f ON f.film_id = fa.film_id
WHERE fa.film_id = fa2.film_id