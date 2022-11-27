/*markdown
## Consultas
Se realizan "al menos dos consultas que extraigan información de al menos dos tablas diferentes".
*/

.headers ON
.mode column

-- 1. Mostrar el nombre de los productos que se han pedido en un pedido.
select 'Productos pedidos en los pedidos' as '';
select ped.id as id_pedido, prod.nombre as nombre_producto
from producto as prod, pedido as ped, productopedido as pp
where prod.id = pp.id_producto and ped.id = pp.id_pedido
order by ped.id;

-- 2. Seleccionar todos los pedidos que se hayan pagado con tarjeta con factura anterior a 2020.
select 'Pedidos pagados con tarjeta con factura anterior a 2020' as '';
select ped.id as id_pedido, f.fecha as fecha_factura
from pedido as ped, factura as f, pago as p
where ped.id = f.id_pedido and f.id_pago = p.id and p.forma_pago = 'Tarjeta' and f.fecha < '2020-01-01';

-- 3. Seleccionar los albaranes de los pedidos que contengan más de dos productos.
select 'Albaranes de los pedidos que contienen más de dos productos' as '';
select a.id as id_albaran, ped.id as id_pedido, count(pp.id_producto) as num_productos
from albaran as a, pedido as ped, productopedido as pp
where a.id_pedido = ped.id and ped.id = pp.id_pedido
group by a.id, ped.id
having count(pp.id_producto) > 2;

-- 4. Obtener información sobre los proveedores de los cuales se tengan productos con menos de 15 unidades en stock.
select 'Proveedores de los productos con menos de 15 unidades en stock' as '';
select prod.nombre as nombre_producto, prod.stock as stock_producto, prov.nombre as nombre_proveedor, prov.CIF as CIF_proveedor
from producto as prod
inner join proveedor as prov on prod.CIF_proveedor = prov.CIF
where prod.stock < 15
order by prod.stock;