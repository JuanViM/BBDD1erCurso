# 1 Listar los nombres de los usuarios.
select nombre from tblusuarios;

# 2 Calcular el saldo máximo de los usuarios de sexo “Mujer”
select max(saldo) from tblusuarios where sexo="M";

# 3 Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY.
select nombre,telefono from tblusuarios where marca in("NOKIA","BLACKBERRY","SONY");

# 4 Contar los usuarios sin saldo o inactivos.
select count(*) from tblusuarios where saldo ="null";

# 5 Listar el login de los usuarios con nivel 1, 2 o 3.
select usuario from tblusuarios where nivel in("1","2","3");

# 6 Listar los números de teléfono con saldo menor o igual a 300.
select telefono from tblusuarios where saldo<=300;

# 7 Calcular  la  suma  de  los  saldos  de  los  usuarios  de  la compañía telefónica NEXTEL.
select sum(saldo) from tblusuarios where compañia="NEXTEL";

# 8 Contar el número de usuarios por compañía telefónica.
select compañia, count(usuario) from tblusuarios group by compañia;

# 9 Contar el número de usuarios por nivel.
select nivel,count(usuario) from tblusuarios group by nivel;

# 10 Listar el login de los usuarios con nivel 2.
select nivel,usuario,nivel from tblusuarios where nivel="2";

# 11 Mostrar el email de los usuarios que usan GMail.
select usuario,email from tblusuarios where email like '%gmail.com';

# 12 Listar  nombre  y  teléfono  de  los  usuarios  con  teléfono  LG,  SAMSUNG  o MOTOROLA.
select nombre,telefono,marca from tblusuarios where marca in("LG","SAMSUNG","MOTOROLA");

# 13 Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG.
select nombre,telefono,marca from tblusuarios where marca not in("LG","SAMSUNG");

# 14 Listar el login y teléfono de los usuarios con compañíatelefónica IUSACELL.
select usuario,telefono,compañia from tblusuarios where compañia="IUSACELL";

# 15 Listar el login y teléfono de los usuarios con compañía telefónica que no sea TELCEL.
select usuario,telefono,compañia from tblusuarios where compañia not in("TELCEL");

# 16 Calcular el saldo promedio de los usuarios que tienen teléfono marca NOKIA.
select avg(saldo) from tblusuarios WHERE marca="NOKIA";

# 17 Listar el login y teléfono de los usuarios con compañíatelefónica IUSACELL o AXEL.
select usuario,telefono,compañia from tblusuarios where compañia in("IUSACELL","AXEL");

# 18 Mostrar el email de los usuarios que no usan Yahoo.
select usuario,email from tblusuarios where email not like "%yahoo%";

# 19 Listar el login y teléfono de los usuarios con compañíatelefónica que no sea TELCEL o IUSACELL.
select usuario,telefono,compañia from tblusuarios where compañia not in("TELCEL","IUSACELL");

# 20 Listar el login y teléfono de los usuarios con compañíatelefónica UNEFON.
SELECT usuario,telefono,compañia from tblusuarios Where compañia="UNEFON";

# 21 Listar las diferentes marcas de celular en ordenalfabético descendentemente.
SELECT marca from tblusuarios group by marca order by marca desc;

# 22 Listar las diferentes compañías en orden alfabético aleatorio.
select compañia from tblusuarios group by compañia order by rand(); 

# 23 Listar el login de los usuarios con nivel 0 o 2.
select usuario,nivel from tblusuarios where nivel in("0","2");

# 24 Calcular el saldo promedio de los usuarios que tienen teléfono marca LG.
select avg(saldo),marca from tblusuarios where marca="LG";

# 25 Listar el login de los usuarios con nivel 1 o 3.
select usuario,nivel from tblusuarios where nivel in ("1","3");

# 26 Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACKBERRY.
select usuario,telefono,marca from tblusuarios where marca not in("BLACKBERRY");

# 27 Listar el login de los usuarios con nivel 3.
SELECT usuario,nivel from tblusuarios where nivel = "3";

# 28 Listar el login de los usuarios con nivel 0.
select usuario,nivel from tblusuarios where nivel= "0";

# 29 Listar el login de los usuarios con nivel 1.
select usuario,nivel from tblusuarios where nivel = "1";

# 30 Contar el número de usuarios por sexo.
select count(usuario),sexo from tblusuarios group by sexo;

# 31 Listar el login y teléfono de los usuarios con compañíatelefónica AT&T.

 






