--Usando la BD de Sakila, y en un script de SQL separado, y en su propio repo de Github, escribir los queries necesarios y suficientes para dar respuesta a las siguientes preguntas:

--Cómo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campaña?
--Asi lo haria en la vida real si es que veo que son pocos 
select *
from customer_list cl 
where cl.country in ('Canada');

select c.first_name, c.last_name, c.email 
from customer c 
where c.customer_id in (189,410,436,476);
--Creo 	que asi lo quiere usted
select concat(c.first_name,' ',c.last_name) , c.email 
from customer c
join address a on c.address_id = a.address_id
join city  cy on a.city_id = cy.city_id
join country ct on ct.country_id = cy.country_id
where ct.country in ('Canada');
--Qué cliente ha rentado más de nuestra sección de adultos?


SELECT r.customer_id, COUNT(*)
FROM rental r
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id 
LEFT JOIN film f ON i.film_id = f.film_id 
LEFT join film_category fc on f.film_id = f.film_id 
WHERE f.rating in  ('R')
GROUP BY r.customer_id;

select concat(c.first_name,' ',c.last_name)
from customer c 
where c.customer_id in (148,576);
--Qué películas son las más rentadas en todas nuestras stores?
	select f.title, count(r.rental_date) 
	from film  f
	join inventory i on i.film_id = f.film_id
	join rental r on r.inventory_id = i.inventory_id
	group by f.title
	order by count(r.rental_date) desc;



--Cuál es nuestro revenue por store?
	select store , total_sales 
	from sales_by_store;

