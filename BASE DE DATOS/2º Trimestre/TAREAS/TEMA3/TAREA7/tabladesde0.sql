create database practica7;


create table doctor (
doctor_no varchar(3) not null,
hospital_cod varchar(2) not null,
apellido varchar(15),
especialidad varchar(20), 
primary key(doctor_no,hospital_cod)) ;

create table departamentos(
dept_no varchar(2)primary key not null,
nombre varchar(15),
localidad varchar(15));

create table empleado(
empleado_no varchar(4) not null primary key,
apellido varchar(20),
oficio varchar(15),
director varchar(4),
fecha_alta datetime,
salario double,
comision double,
dept_no varchar(2) not null);

create table hospital(
hospital_cod varchar(2) not null primary key,
nombre varchar(20),
direccion varchar(30),
telefono varchar (9),
num_camas int); 

create table plantilla(
empleado_no varchar(4) not null,
hospital_cod varchar(2) not null,
sala_cod varchar(2) not null,
apellido varchar(15),
funcion varchar(10),
turno varchar(1),
salario double,
primary key(empleado_no,hospital_cod,sala_cod));

create table sala(
sala_cod varchar(2) not null,
hospital_cod varchar(2)not null,
nombre varchar(20),
num_camas int,
primary key (sala_cod,hospital_cod));

create table ocupacion(
inscripcion varchar(5) not null,
hospital_cod varchar(2) not null,
sala_cod varchar(2) not null,
cama varchar(4),
primary key (inscripcion,hospital_cod,sala_cod));

create table enfermo(
inscripcion varchar(5) primary key not null,
apellido varchar(15),
direccion varchar(30),
fecha_nac datetime,
sexo varchar(1),
nss varchar(15));

/* crearemos las claves foraneas ahora */

alter table doctor
add constraint FKHospital
foreign key (hospital_cod) references hospital(hospital_cod);

alter table empleado
add constraint FKdepartamento
foreign key (dept_no) references departamentos(dept_no);

alter table plantilla
add constraint FKhospitalplan
foreign key (hospital_cod) references hospital(hospital_cod);

alter table plantilla
add constraint FKsalacod
foreign key (sala_cod) references sala(sala_cod);

alter table sala
add constraint FKhospisala
foreign key (hospital_cod) references hospital(hospital_cod);

alter table ocupacion
add constraint FKinscrienerfem
foreign key (inscripcion) references enfermo(inscripcion);

alter table ocupacion
add constraint FKhospiocupa
foreign key (hospital_cod) references hospital(hospital_cod);

alter table ocupacion
add constraint FKsalaocupa
foreign key (sala_cod) references sala(sala_cod); 


insert into plantilla 
values("1236","22","2","Garcia J.","Enfermero","M","2900");

insert into plantilla (hospital_cod, sala_cod, empleado_no, apellido) values (2,22,1235,"Perez A.");

update enfermo set direccion = "alcala 411" where inscripcion = "74835";

set SQL_SAFE_UPDATES=0;
update enfermo set direccion = null;

update hospital set num_camas = num_camas*1.1;
