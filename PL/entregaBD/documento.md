---
title: "Tarea 7: diseño de BD - explicación"
author: "Juan Francisco Mier Montoto"
date: 2022-11-27
---

# Explicación de la entrega

## Diseño de la base de datos
La base de datos se ha creado a partir del diagrama de clases "ASI-IS2022G41-CLASES.vsdx".
Todas las clases incluidas tratan sobre la gestión de pedidos, incluyendo proveedores, facturas, albaranes, etc.
Se han mantenido todos los campos del diagrama, únicamente añadiendo tipos a cada uno de ellos según conveniente.
Como indicado, todas las tablas tienen más de tres columnas.

## Metodología
Para la creación de la base de datos se ha utilizado SQlite como indicado en el enunciado, en conjunto con VSCode y sqlite-libs para poder trabajar con la base de datos desde Linux. Este pequeño documento se ha creado en Markdown.

## Consultas
Las consultas son, en orden:

1. Mostrar el nombre de los productos que se han pedido en todos los pedidos.
2. Seleccionar todos los pedidos que se hayan pagado con tarjeta con fecha anterior a 2020.
3. Seleccionar los albaranes de los pedidos que contengan más de dos productos.
4. Obtener información sobre los proveedores de los cuales se tengan productos con menos de 15 unidades en stock.

Todas las consultas se hacen sobre más de dos tablas como indicado en el enunciado. La primera usa `order by`, la segunda filtra según la fecha, la tercera usa `group by` y la última filtra según el stock de cada producto registrado utilizando inner join.

## Comentarios
Al principio de cada script se utilizan los comandos `.mode column` y `.headers on` para que la salida de las consultas sea más legible. Además, se ponen comentarios en cada consulta para indicar qué hace cada una de ellas.
