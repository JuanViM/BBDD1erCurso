create database practica1;
use practica1;
create table empleados(NIF integer primary key,
nombre varchar(20),
apellido1 varchar(45),
apellido2 varchar(45),
direccion varchar(45),
telefono int(15),
email varchar(50),
sueldo int(10));

create table clientes(NIF integer primary key,
nombre varchar(20),
apellido1 varchar(45),
apellido2 varchar(45),
direccion varchar(45),
telefono int (15),
email varchar(50));

create table coches(matricula integer primary key,
marca varchar(20),
modelo varchar(45),
tipo varchar(45)
);

# 1 insertar un empleado.
insert into empleados 
values("85963215","manolo","Garrido","Garcia","C/ceda","854258574","manolo@gmail.com","1200"); 

# 1 insertar un coche.
insert into coches values ("855874878","Seat","toledo","familiar");

# 1 insertar un clientes
insert into clientes 
values("74856525","Antonio","Suarez","Martin","C/belen","663267415","manolo@gmail.com");


# 2 obtener todos los clientes que son de almeria.
select * from clientes where direccion= "Almeria";

# 3 Obtener  el  nombre  y  apellidos  de  los  empleados  que  ganan  más  de  1025 euros.
select nombre,apellido1,apellido2,sueldo from empleados where sueldo>1025;

# 4 Obtener la suma de los sueldos de los empleados de Madrid
select SUM(sueldo) from empleados where direccion="Madrid";

# 5 Obtener los datos de los coches de la marca Peugeot y modelo 3008.
select * from coches where marca="peugeot" and modelo="3008";

# 6 Obtener el sueldo medio de los empleados.
select avg(sueldo) from empleados;

# 7 Obtener el sueldo máximo de todos los empleados.
select max(sueldo) from empleados;

# 8 Obtener el nombre, apellido1, apellido2, teléfono y email de los  empleados cuyo sueldo está entre 600€ y 1000€.
select nombre,apellido1,apellido2,telefono,email from empleados where sueldo>1000 and sueldo<600;

# 9 Obtener el número de coches de la marca Renault.
select count(*) from coches where marca="peugeot";

# 10 Obtener el número de coches de cada una de las marcas.
select count(marca) from coches group by marca;




