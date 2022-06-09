use ud5cp4;

# 1. Obtener el nombre de cada empleado, su oficio, su número de departamento y 
# el nombre del departamento donde trabajan.
select em.apellido,oficio,dep.dept_no,dep.nombre as "nombre departamento" 
from empleado em,departamentos dep 
where dep.dept_no = em.dept_no;

# 2. Obtener los nombres, profesiones y localidades de los departamentos donde trabajan 
# los Analistas.
select apellido,oficio,localidad 
from empleado em,departamentos dep 
where em.dept_no = dep.dept_no and oficio="Analista";

# 3. Obtener el nombre y oficio de todos aquellos empleados que trabajan en Madrid.
# La salida deberá estar ordenada por el oficio.
select apellido,oficio from empleado em,departamentos dep where em.dept_no=dep.dept_no 
and dep.localidad="Madrid"
order by em.oficio;

# 4. Obtener cuántos empleados existen en cada departamento. 
# Devolviendo una salida como la que se presenta 
#NUM-DEP DEPARTAMENTO N-EMPL
#------- ------------ ------
#30 VENTAS 6
#20 INVESTIGACIÓN 5
#10 CONTABILIDAD 3
#(deberá estar ordenada por el número de empleados de forma descendente).

select dep.dept_no,dep.nombre,count(em.empleado_no) as "N-EMPL"
from departamentos dep,empleado em where dep.dept_no=em.dept_no 
group by dep.nombre
order by count(em.empleado_no) desc;

#5. Se desea conocer, tanto para el departamento de VENTAS,
#como para el de CONTABILIDAD, su máximo, su mínimo y su media salarial,
#así como el número de empleados en cada departamento. 
#La salida deberá estar ordenada por el nombre del departamento, 
#y se deberá presentar como la siguiente:
#DNOMBRE MAXIMO MÍNIMO MEDIA N-EMPL
#------------ ------ ------ ----- ------
#CONTABILIDAD 650000 169000 379166.667 3
#VENTAS 370500 123500 203666.667 6

select dep.nombre,max(salario),MIN(salario),avg(salario),count(em.empleado_no) as "N-EMPL" 
from empleado em,departamentos dep 
where dep.nombre in("ventas","contabilidad") 
and dep.dept_no=em.dept_no
group by dep.nombre
order by dep.nombre;

#6 Se desea conocer el máximo salario que existe en cada sala de cada hospital, 
#dando el resultado como sigue:
#HOSPITAL SALA MAXIMO
#---------- ---- -------------
#General Cardiología 3379000
#La Paz Maternidad 2210000
#La Paz Psiquiátrico 2005000
#La Paz Recuperación 2119000
#Provincial Psiquiátrico 2755000

select hos.nombre,sa.nombre,max(salario) from plantilla pla,sala sa,hospital hos where hos.hospital_cod= sa.hospital_cod 
and sa.sala_cod=pla.sala_cod
GROUP BY hos.hospital_cod,sa.nombre;


#7. Se desea obtener un resultado como el que aparece, en el que se presenta el número,
#nombre y oficio de cada empleado de nuestra empresa que tiene jefe, 
#y lo mismo de su jefe directo. La salida debe estar ordenada por el nombre del empleado.
#EMPLEADO NOMBRE OFICIO JEFE NOMBRE OFICIO
#-------- ------ ------ ---- ------ ----------
#7876 ALONSO EMPLEADO 7788 GIL ANALISTA
#7499 ARROYO VENDEDOR 7698 NEGRO DIRECTOR
#7782 CEREZO DIRECTOR 7839 REY PRESIDENTE


select em1.empleado_no as Empleado,em1.apellido as nombre,em1.oficio,em2.empleado_no as jefe,
em2.apellido,em2.oficio
from empleado em1,empleado em2 where em1.empleado_no=em2.director
ORDER BY em1.apellido



