--Qu� contactos de proveedores tienen la posici�n de sales representative?

select c.contact_name, c.contact_title 
from customers c 
where contact_title in ('Sales Representative');

--Qu� contactos de proveedores no son marketing managers?

select c.contact_name, c.contact_title 
from customers c 
where not contact_title in ('Marketing Manager');



--Cuales �rdenes no vienen de clientes en Estados Unidos?
select o.ship_country , o.order_id 
from orders o 
where not ship_country in('USA');

--Qu� productos de los que transportamos son quesos?
select p.product_name, p.product_id 
from  products p 
where category_id=4 ;

--Qu� ordenes van a B�lgica o Francia?

select o.ship_country , o.order_id 
from orders o 
where ship_country in('Belgium','France');

--Qu� �rdenes van a LATAM?
select o.ship_country , o.order_id 
from orders o 
where ship_country in('Argentina','Venezuela','Mexico','Brazil');


--Qu� �rdenes no van a LATAM?
select o.ship_country , o.order_id 
from orders o 
where not ship_country in('Argentina','Venezuela','Mexico','Brazil');

--Necesitamos los nombres completos de los empleados, nombres y apellidos unidos en un mismo registro

select e.first_name,e.last_name, CONCAT_WS(', ', last_name, first_name) full_name
from employees e;

--Cu�nta lana tenemos en inventario?

select sum(p.unit_price*p.units_in_stock) from products p;


--Cuantos clientes tenemos de cada pa�s?
select  o.ship_country, count(*)
from orders o 
group by ship_country 
having COUNT(*)>1;

