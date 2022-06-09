/*Ejercicio 1*/
select e.apellido,e.oficio, e.dept_no, d.nombre
from empleado e, departamentos d
where e.dept_no=d.dept_no;

/*Ejercicio 2*/
select e.apellido,d.nombre, d.localidad, e.oficio
from empleado e, departamentos d
where e.dept_no=d.dept_no 
and e.oficio like 'Analista';

/*Ejercicio 3*/
select e.apellido,e.oficio,d.localidad
from empleado e, departamentos d
where e.dept_no=d.dept_no 
and d.localidad like 'Madrid'
order by e.oficio;

/*Ejercicio 4*/
select d.dept_no,d.nombre,count(*) as 'Nº Empleado'
from empleado e, departamentos d
where e.dept_no=d.dept_no 
group by d.dept_no
order by 3 desc;

/*Ejercicio 5*/
select d.nombre, max(e.salario),min(e.salario), avg(e.salario), count(*) as'Nº Trabajadores'
from empleado e, departamentos d
where e.dept_no=d.dept_no 
and d.nombre in('Ventas','Contabilidad')
group by d.nombre
order by d.nombre;

/*Ejercicio 6*/
select h.nombre, s.nombre, max(p.salario) as'Salario Maximo'
from hospital h,sala s, plantilla p
where h.hospital_cod=s.hospital_cod
and s.sala_cod=p.sala_cod
group by s.nombre,h.nombre;

/*Ejercicio 7*/
select e1.empleado_no,e1.apellido,e1.oficio, e2.empleado_no as 'Jefe', e2.apellido,e2.oficio
from empleado e1, empleado e2
where e1.director=e2.empleado_no
group by e1.empleado_no;

/*Ejercicio 8*/
select d.nombre, min(e.salario)
from departamentos d, empleado e
where e.dept_no=d.dept_no
and e.oficio !='Empleado'
group by d.nombre
order by e.salario desc;

/*Ejercicio 9*/
select e.apellido, e.dept_no,e.oficio
from departamentos d, empleado e
where e.dept_no=d.dept_no
and e.dept_no='20'
and e.oficio in(select oficio from empleado where oficio != 'Empleado');

/*Ejercicio 10*/
select e.empleado_no, e.dept_no, e.apellido
from empleado e
where e.dept_no in(20,30)
and e.salario > (select 2*min(salario) from empleado)
and e.oficio != 'Presidente';

/*Ejercicio 11*/
select *
from plantilla
where (salario) >= (select max(salario) + 300  /* Si no ponemos el igual va a salir null por que ganarian el mismo salario 3300€*/
					from plantilla
					where turno ='M')
and funcion in (select funcion
				from plantilla
                where apellido like "Nuñez C.");
                
/*Ejercicio 12*/
select e.apellido,e.oficio, e.salario,e.dept_no
from empleado e
where e.salario >(select max(e.salario)
				  from empleado e
                  where e.dept_no=30);

/*Ejercicio 13*/
select * 
from empleado
where salario > (select min(salario)
				 from empleado)
and salario < (select max(salario)
				from empleado);
                
/*Ejercicio 14*/
select e1.dept_no, max(e1.salario),e1.apellido,e2.dept_no,min(e2.salario),e2.apellido
from empleado e1, empleado e2
where e1.salario in (select max(salario)
					from empleado)
and e2.salario in (select min(salario)
					from empleado);

/*Ejercicio 15*/
select apellido, oficio, dept_no
from empleado
where salario > (select avg(salario) from empleado where dept_no =10)
and (select avg(salario) from empleado where dept_no =20)
and (select avg(salario) from empleado where dept_no =30)
and (select avg(salario) from empleado where dept_no =40);

/*Ejercicio 16*/
select  e1.apellido, e1.oficio,e1.dept_no
from empleado e1, empleado e2
where e1.empleado_no=e2.director
group by e1.empleado_no;

/*Ejercicio 17*/
select empleado_no, apellido , hospital_cod, salario
from plantilla p
where salario > (select avg(salario)
				 from plantilla p2
                 where p2.hospital_cod=p.hospital_cod);

/*Ejercicio 18*/
select e.apellido, d.nombre,d.dept_no,e.fecha_alta
from empleado e, departamentos d
where e.dept_no=d.dept_no
and fecha_alta = (select max(fecha_alta)
				  from empleado e2
                  where e.dept_no=e2.dept_no
                  group by dept_no);










