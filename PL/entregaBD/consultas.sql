/*markdown
## Consultas
Se realizan "al menos dos consultas que extraigan información de al menos dos tablas diferentes".
*Recomendado usar ".headers ON".*
*/

/* 1. Mostrar el nombre de los productos que se han pedido en un pedido. */
select ped.id as id_pedido, prod.nombre as nombre_producto
from producto as prod, pedido as ped, productopedido as pp
where prod.id = pp.id_producto and ped.id = pp.id_pedido
order by ped.id;

/* 2. Seleccionar todos los pedidos que se hayan pagado con tarjeta con factura anterior a 2020. */
select ped.id as id_pedido, f.fecha as fecha_factura
from pedido as ped, factura as f, pago as p
where ped.id = f.id_pedido and f.id_pago = p.id and p.forma_pago = 'Tarjeta' and f.fecha < '2020-01-01';

/* 3. Seleccionar los albaranes de los pedidos que contengan más de dos productos. */
select a.id as id_albaran, ped.id as id_pedido
from albaran as a, pedido as ped, productopedido as pp
where a.id_pedido = ped.id and ped.id = pp.id_pedido
group by a.id, ped.id
having count(pp.id_producto) > 2;