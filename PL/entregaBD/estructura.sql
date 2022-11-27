/*markdown
# Tarea 7: diseño de bd (opcional)
## Creación de las tablas
Primero, se crean las tablas de la base de datos.
---
Para crear las tablas, se genera una tabla permanente llamada "test.db" haciendo "sqlite3 test.db".
Posteriormente, se ejecuta el script haciendo ".read opcional.sql".
*/

.headers ON
.mode column
---
drop table if exists proveedor;
drop table if exists pedido;
drop table if exists producto;
drop table if exists factura;
drop table if exists albaran;
drop table if exists pago;
drop table if exists productopedido;
---
create table proveedor (
    nombre string not null,
    direccion string,
    CIF string not null primary key,
    IBAN integer,
    telefono integer,
    ambito string not null
);
---
create table pedido (
    id integer not null primary key autoincrement,
    fecha date not null,
    importe double not null,
    CIF_proveedor string not null references proveedor(CIF),
    id_factura integer not null references factura(id),
    id_albaran integer references albaran(id)
);
---
create table if not exists factura (
    id integer not null primary key autoincrement,
    fecha date not null,
    importe double not null,
    id_pedido integer not null references pedido(id),
    id_pago integer references pago(id)
);
---
create table if not exists pago (
    id integer not null primary key autoincrement,
    fecha date not null,
    forma_pago string not null,
    id_factura integer not null references factura(id)
);
---
create table if not exists albaran (
    id integer not null primary key autoincrement,
    fecha date not null,
    id_pedido integer not null references pedido(id)
);
---
create table if not exists productopedido (
    id integer not null primary key autoincrement,
    cantidad integer not null,
    id_pedido integer not null references pedido(id),
    id_producto integer not null references producto(id)
);
---
create table if not exists producto (
    id integer not null primary key autoincrement,
    nombre string not null,
    precio double not null,
    stock integer not null,
    CIF_proveedor string not null references proveedor(CIF)
);

/*markdown
## Inserción de datos
Se insertan datos aleatorios en cada tabla para poder realizar las consultas.
*/

insert into proveedor values ('Carrefour', 'Avenida sin nombre', '798456132V', 98733216983532, 654321987, 'Gran superficie');
insert into proveedor values ('Mercadona', 'Calle sin nombre', '258364971F', 3216543212332, 693259174, 'Supermercado');
insert into proveedor values ('Matadero', 'Camino del Melón', '123456789A', 4568932651736, 673145289, 'Alimentacion');
insert into proveedor values ('Carniceria Manolito', 'Calle de la Cebolla', '987654321B', 9876543219876, 654321987, 'Alimentacion');
---
insert into producto values (1, 'Leche', 0.5, 12, '798456132V');
insert into producto values (2, 'Pan', 0.3, 96, '798456132V');
insert into producto values (3, 'Cerveza', 1.5, 25, '798456132V');
insert into producto values (4, 'Coca-Cola', 1.5, 66, '258364971F');
insert into producto values (5, 'Hamburguesa', 2.5, 45, '987654321B');
insert into producto values (6, 'Patatas', 1.5, 79, '258364971F');
insert into producto values (7, 'Pollo', 3.5, 23, '123456789A');
insert into producto values (8, 'Chuleta', 4.5, 10, '123456789A');
insert into producto values (9, 'Chorizo', 2.5, 1, '987654321B');
insert into producto values (10, 'Queso', 1.5, 5, '258364971F');
---
insert into pedido values (1, '2018-01-01', 100, '12345678A', 1, 1);
insert into pedido values (2, '2018-06-02', 50.5, '87654321B', 2, 2);
insert into pedido values (3, '2019-01-03', 10.23, '12345678B', 3, 3);
insert into pedido values (4, '2021-01-04', 45.79, '87654321A', 4, 4);
insert into pedido values (5, '2018-01-05', 205.1, '12345678C', 5, 5);
insert into pedido values (6, '2021-03-19', 53, '87654321C', 6, 6);
insert into pedido values (7, '2022-12-06', 47.11, '12345678D', 7, 7);
insert into pedido values (8, '2020-01-07', 97.4, '87654321D', 8, 8);
---
insert into factura values (1, '2018-01-01', 100.5, 1, 1);
insert into factura values (2, '2018-06-02', 51, 2, 2);
insert into factura values (3, '2019-01-03', 10.73, 3, 3);
insert into factura values (4, '2021-01-04', 46.29, 4, 4);
insert into factura values (5, '2018-01-05', 205.6, 5, 5);
insert into factura values (6, '2021-03-19', 53.5, 6, 6);
insert into factura values (7, '2022-12-06', 47.61, 7, 7);
insert into factura values (8, '2020-01-07', 97.9, 8, 8);
---
insert into pago values (1, '2018-12-01', 'Efectivo', 1);
insert into pago values (2, '2018-06-02', 'Tarjeta', 2);
insert into pago values (3, '2019-01-03', 'Transferencia', 3);
insert into pago values (4, '2021-01-04', 'Efectivo', 4);
insert into pago values (5, '2018-01-05', 'Tarjeta', 5);
insert into pago values (6, '2021-03-19', 'Transferencia', 6);
insert into pago values (7, '2022-12-06', 'Efectivo', 7);
insert into pago values (8, '2020-01-07', 'Tarjeta', 8);
---
insert into albaran values (1, '2018-01-01', 1);
insert into albaran values (2, '2018-06-02', 2);
insert into albaran values (3, '2019-01-03', 3);
insert into albaran values (4, '2021-01-04', 4);
insert into albaran values (5, '2018-01-05', 5);
insert into albaran values (6, '2021-03-19', 6);
insert into albaran values (7, '2022-12-06', 7);
insert into albaran values (8, '2020-01-07', 8);
---
insert into productopedido values (1, 10, 1, 1);
insert into productopedido values (2, 20, 2, 2);
insert into productopedido values (3, 30, 3, 3);
insert into productopedido values (4, 40, 4, 4);
insert into productopedido values (5, 5, 1, 6);
insert into productopedido values (6, 6, 2, 5);
insert into productopedido values (7, 7, 3, 4);
insert into productopedido values (8, 8, 4, 3);
insert into productopedido values (9, 9, 5, 2);
insert into productopedido values (10, 10, 6, 1);
insert into productopedido values (11, 11, 7, 1);
insert into productopedido values (12, 12, 8, 2);
insert into productopedido values (13, 13, 1, 3);
insert into productopedido values (14, 14, 2, 4);