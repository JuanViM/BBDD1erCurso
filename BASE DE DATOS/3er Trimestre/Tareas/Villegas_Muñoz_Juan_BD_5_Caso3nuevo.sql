# 1. Obtener el DNI y nombre de aquellos investigadores que han realizado más de una reserva.
select distinct inv.DNI, inv.nombre from investigador inv, reservas re where inv.dni = re.dni group by inv.dni having count(re.dni)>1 ;

# 2. Obtener un listado completa de reservas, incluyendo los siguientes datos:
#• DNI y nombre del investigador, junto con el nombre de su facultad.
#• Número de serie y nombre del equipo reservado, junto con el nombre de la facultad a la que pertenece.
#• Fecha de comienzo y fin de la reserva.

select re.*,
inv.dni,inv.nombre,fa.nombre,
eq.numSerie,eq.nombre,faeq.nombre,
re.fechaComienzo,re.fechaFin
from equipo eq,facultad fa,investigador inv,reservas re,facultad faeq
where inv.DNI = re.DNI
 and re.idequipo=eq.idequipo 
 and eq.idFacultad = faeq.idfacultad 
 and fa.idfacultad=inv.idFacultad;

#3. Obtener el DNI y el nombre de los investigadores que han reservado equipos que no son de su facultad.
select inv.DNI,inv.nombre from investigador inv,reservas re,equipo eq where inv.DNI = re.DNI and re.idequipo = eq.idequipo and eq.idFacultad != inv.idfacultad;

select inv.DNI,inv.nombre from investigador inv,reservas re,equipo eq, facultad fac where inv.DNI = re.DNI and re.idequipo = eq.idequipo and eq.idFacultad <> fac.idfacultad group by inv.dni;

