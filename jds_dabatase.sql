create database jds_database;
use jds_database;
-- drop database jds_database;

create table usuario(
id_user int auto_increment primary key,
name_user varchar(20) null,
lastname_user varchar (40) null,
email_user varchar(40) unique,
password_user varchar(20) not null,
role_user enum('Empleado','Cliente') not null,
state_user enum('activo','inactivo') not null
);


select role_user from usuario where id_user=3;
create table maquinas(
id_machine int auto_increment primary key,
make_machine varchar (30) not null,
type_machine varchar(30) not null
);

create table empleado(
id_emple int auto_increment  key,
post_emple varchar (10) not null,
idUserFK int,
foreign key (idUserFK) references usuario(id_user)
);




create table notificacion_maqui(
id_notify int auto_increment primary key,
time_notify datetime not null,
idMachineFK int,
idEmpleFK int,
foreign key (idMachineFK) references maquinas(id_machine),
foreign key (idEmpleFK) references empleado(id_emple)
);

create table cliente(
id_client int auto_increment primary key,
phone varchar(11) not null,
idUserFk int,

foreign key (idUserFK) references usuario(id_user)
);





create table servicio(
id_servi int auto_increment primary key,
price_servi double not null,
type_servi varchar(30) not null,
descrip_servi varchar(50) not null
);

insert into servicio (price_servi, type_servi,descrip_servi) VALUES (4000,"Tintura", "Te tinturamos el pelo");




create table cita(
id_cita int auto_increment primary key,
date_meet datetime not null,
idServiFK int,
idClieFK Int,
foreign key(idServiFK) references servicio(id_servi),
foreign key(idClieFK) references cliente(id_client)
);



create table resultados(
id_obser int auto_increment primary key,
observa_obser varchar(120),
idCitaFK int,      
foreign key (idCitaFK) references cita(id_cita)
);