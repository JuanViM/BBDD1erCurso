# 1. Obtener el DNI y nombre de aquellos investigadores que han realizado más de una reserva.
select inv.DNI, inv.nombre from investigador inv, reservas re where inv.DNI = re.DNI group by inv.dni having count(re.DNI)>1;

# 2. Obtener un listado completa de reservas, incluyendo los siguientes datos:
# • DNI y nombre del investigador, junto con el nombre de su facultad.
# • Número de serie y nombre del equipo reservado, junto con el nombre de la facultad a la que pertenece.
# • Fecha de comienzo y fin de la reserva.
select inv.DNI, inv.nombre as Nombre_investigador, fac.nombre as Nombre_facultad,
inv.DNI,eq.nombre as Nombre_Equipo, fac.nombre as Nombre_facultad,
eq.numSerie,eq.nombre as Nombre_Equipo, fac.nombre as Nombre_facultad,
re.fechaComienzo,re.fechaFin
from investigador inv, facultad fac,equipo eq,reservas re
where inv.DNI = re.DNI and 
re.idequipo = eq.idequipo and
eq.idFacultad = fac.idFacultad and
fac.idFacultad = inv.idFacultad;

#3. Obtener el DNI y el nombre de los investigadores que han reservado equipos que no son de su facultad.
select distinct inv.DNI,inv.nombre from investigador inv,reservas re,equipo eq, facultad fac where inv.DNI = re.DNI and re.idequipo = eq.idequipo and eq.idFacultad <> fac.idfacultad;

# 4. Obtener los nombres de las facultades en las que ningún investigador ha realizado una reserva.
select fa.nombre from facultad fa where fa.idfacultad not in(select fa.idfacultad from facultad fa,equipo eq,reservas re where fa.idfacultad = eq.idFacultad and eq.idequipo = re.idequipo );

# 5. Obtener los nombres de las facultades con investigadores ’ociosos’ (investigadores que no han realizado ninguna reserva).
select fa.nombre from facultad fa where fa.idfacultad not in(select fa.idfacultad from facultad fa,reservas re,investigador inv where fa.idfacultad = inv.idFacultad and re.DNI = inv.DNI); 

# 6. Obtener el número de serie y nombre de los equipos que nunca han sido reservados.
select eq.numSerie, eq.nombre from equipo eq where eq.idequipo not in(select eq.idequipo from equipo eq,reservas re where eq.idequipo = re.idequipo);

# 7. Obtener los datos de los investigadores que han reservado un equipo, detallando los datos del equipo, y que no lo han liberado aún.
select inv.*,eq.*,re.fechaFin as Equipo_Liberado from investigador inv,reservas re,equipo eq where (select re.fechaFin from reservas re, investigador inv where inv.DNI = departamentosre.dni having re.fechaFin is null);

# 8. Obtener el número de equipos reservados por los investigadores de cada una de las facultades.
select count(eq.idequipo) from equipo eq, investigador inv,reservas re,facultad fa where inv.DNI = re.DNI and eq.idequipo = re.idequipo and fa.idfacultad = inv.idFacultad;