# 1. Obtener todos los nombres de empleados y nombre del departamento de los empleados sin comisión.
select e.nombre,d.nombre,e.comision from empleados e, departamentos d where e.dnumero = d.numero and e.comision is null;

# 2. Obtener todos los datos de los empleados y del departamento al que pertenecen.
select em.*, d.* from empleados em,departamentos d where em.dnumero= d.numero;
 
# 3. Obtener el nombre de cada empleado, y el nombre de su jefe.
select em1.nombre as empleado,em2.nombre as jefe from empleados em1,empleados em2 where em1.jefe = em2.numero;

# 4. Obtener el nombre de cada departamento y la media de sus salarios.
select d.nombre, avg(em.salario) from empleados em, departamentos d where em.dnumero = d.numero group by d.numero;

# 5. Obtener el nombre de cada departamento cuyo número de empleados es mayor a 2.
select de.nombre from departamentos de,empleados em where em.dnumero = de.numero group by dnumero having count(em.numero)>2;

# 6. Obtener el nombre de los empleados que tienen un salario igual al salario máximo de cada departamento.
select nombre,salario from empleados where salario=any(select max(salario) from empleados e,departamentos d where e.dnumero = d.numero group by e.dnumero);

# 7. Obtener el nombre de cada uno de los jefes y nombre del departamento al que pertenecen.
select em.nombre,de.nombre from empleados em,departamentos de where em.dnumero = de.numero and em.numero in(select distinct jefe from empleados where jefe is not null);

# 8. Obtener para cada departamento su nombre y el nombre del empleado que sea ‘Director’.
select de.nombre,em.nombre from empleados em, departamentos de where puesto="director" and de.numero = em.dnumero;

# 9. Obtener para cada departamento el nombre del departamento y el salario máximo.
select de.nombre,max(salario) from departamentos de,empleados em where em.dnumero = de.numero group by em.dnumero;

# 10. Obtener el nombre de cada departamento y la media de los salarios de aquellos empleados que se contrataron antes del año 1983.
select d.nombre,avg(salario) from departamentos d,empleados e where e.dnumero = d.numero and year(fechaalta)<1983 group by e.dnumero;