# 1. Obtener el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;
# 2. Obtener los nombres y los precios de todos los productos de la tabla producto.
select nombre,precio from producto;
# 3. Obtener el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las
# columnas: nombre de producto, euros, dólares. Tened en cuenta que 1€
# vale 1.20$
select nombre,precio,(precio*1.20) as "Dolares" from producto;

# 4. Obtener los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre asc;

# 5. Obtener los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by nombre desc;

# 6. Obtener los nombres de los productos ordenados en primer lugar por el
#nombre de forma ascendente y en segundo lugar por el precio de forma
#descendente.
select nombre from producto order by nombre asc;
select nombre from producto order by precio desc;

# 7. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
# 8. Obtener el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre,precio from producto where precio<=120;

# 9. Obtener todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

select * FROM Producto WHERE Precio >= 80 AND Precio <= 300;
10. Obtener todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
11. Obtener todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
12. Obtener todos los productos cuyo código de fabricante sea 1, 3 o 5.
13. Obtener el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
14. Obtener los nombres de los fabricantes cuyo nombre empiece por la letra S.
15. Obtener los nombres de los fabricantes cuyo nombre termine por la vocal e.
16. Obtener los nombres de los fabricantes cuyo nombre contenga el carácter w.
17. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
18. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
19. Obtener el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
20. Obtener el número de productos que tiene cada fabricante.