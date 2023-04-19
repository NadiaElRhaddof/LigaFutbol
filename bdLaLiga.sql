drop database if exists bdLaLiga;
create database bdLaLiga;
use bdLaLiga;
create table historico (
goles int not null,
partidos int not null,
id_historico int not null auto_increment,
primary key (id_historico)
);
create table jugador (
tipo varchar(30) not null,
nombre varchar(30) not null,
habilidades varchar(30),
id_jugador int not null auto_increment,
id_historico int not null,
primary key (id_jugador)
);
create table entrenador (
nombre varchar(30) not null,
telefono varchar(9) not null,
id_entrenador int not null auto_increment,
primary key (id_entrenador)
);
create table jug_entr (
id_jugador int not null,
id_entrenador int not null
);
create table equipo (
id_equipo int not null auto_increment,
fundacion varchar(30) not null,
nombre varchar(30) not null,
primary key (id_equipo)
);
create table pertenece (
id_jugador int not null,
id_equipo int not null
);
create table estadio (
nombre varchar(30) not null,
ciudad varchar(30) not null,
id_estadio int not null auto_increment,
primary key (id_estadio)
);
create table juegan (
id_equipo int not null,
id_estadio int not null
);
create table comentador (
nombre varchar(30) not null,
radio varchar(30) not null,
id_comentador int not null auto_increment,
primary key (id_comentador)
);
create table liga (
id_liga int not null auto_increment,
fundacion varchar(30) not null,
nombre varchar(30) not null,
id_comentador int not null,
primary key (id_liga)
);
create table participan (
id_equipo int not null,
id_liga int not null
);
create table patrocinador (
id_patrocinador int not null auto_increment,
nombre varchar(30) not null,
total_patrocinios varchar(30) not null,
primary key (id_patrocinador)
);
create table tienen (
id_liga int not null,
id_patrocinador int not null
);

alter table jugador
add constraint FK_id_historico foreign key (id_historico) references historico (id_historico)
on update cascade;

alter table jug_entr
add constraint FK_id_jugador foreign key (id_jugador) references jugador (id_jugador),
add constraint FK_id_entrenador foreign key (id_entrenador) references entrenador (id_entrenador)
on update cascade;

alter table juegan
add constraint FK_id_equipo2 foreign key (id_equipo) references equipo (id_equipo),
add constraint FK_id_estadio foreign key (id_estadio) references estadio (id_estadio)
on update cascade;

alter table pertenece
add constraint FK_id_jugador2 foreign key (id_jugador) references jugador (id_jugador),
add constraint FK_id_equipo foreign key (id_equipo) references equipo (id_equipo)
on update cascade;

alter table liga
add constraint FK_id_comentador foreign key (id_comentador) references comentador (id_comentador)
on update cascade;

alter table participan
add constraint FK_id_equipo3 foreign key (id_equipo) references equipo (id_equipo),
add constraint FK_id_liga foreign key (id_liga) references liga (id_liga)
on update cascade;

alter table tienen
add constraint FK_id_liga2 foreign key (id_liga) references liga (id_liga),
add constraint FK_id_patrocinador foreign key (id_patrocinador) references patrocinador (id_patrocinador)
on update cascade;

insert into historico values (30, 1000, 10), 
(2, 999, 1), 
(300, 700, 11), 
(123, 500, 3), 
(0, 760, 2);

insert into jugador values ('medio centro', 'Modric', 'visión de juego', 10, 10), 
('delantero', 'Penaldo', 'marcar de penalti', 2, 2), 
('portero', 'Neuer', 'muro infranqueable', 1, 1), 
('stricker', 'Isagi Yoichi', 'Egoistota', 11, 11), 
('delantero', 'Haaland', 'resistencia', 3, 3);

insert into entrenador values ('Carlo Anchelloti', '999999999', 11),
('Pellegrini', '644123324', 3),
('Xavi', '666999000', 2),
('Ernesto', '123456789', 1),
('Luis Enrique', '322859320', 10);

insert into jug_entr values (1,1),
(2,2),
(3,3),
(10,10),
(11,11);

insert into estadio values ('Bernabéu', 'Madrid', 14),
('Camp Nou', 'Barcelona', 5),
('Metropolitano', 'Madrid', 7),
('Estadio Insular LP', 'Ciudad Jardín', 1),
('Presidente Peron', 'Avellaneda', 2);

insert into equipo values (14, 'fundacionmadrid.org', 'Madrid'),
(5, 'fundacion.barcelona.es', 'Barça'),
(7, 'atleticodemadrid.com', 'Atletico de Madrid'),
(1, 'udlaspalmas.es', 'UD Las Palmas'),
(2, 'realracingclub.es', 'Racing');

insert into juegan values (14,14),
(5,5),
(2,2),
(1,1),
(7,7);

insert into comentador values ('Pablo', 'Radio Española', 1),
('Nadia', 'Radio Mittens', 2),
('Azael', 'Radio Samba', 3),
('JJ', 'Radio Latino', 4),
('Aytha', 'Radio Pandora FMS', 5);

insert into liga values (1, 'Santander', 'España', 1),
(2, 'SmartBank', 'España', 2),
(3, 'PlayStation', 'Japón', 3),
(4, 'Adidas Krombacher', 'Herzogenaurach', 4),
(5, ' EA Sports', 'Redwood City', 5);

insert into participan values (14,1),
(5,2),
(7,3),
(1,4),
(2,5);

insert into patrocinador values (1, 'Santander', 70000),
(2, 'Smartbank', 20000),
(3, 'PlayStation', 40000),
(4, 'Adidas Krombacher', 10000),
(5, 'EA Sports', 100000);

insert into tienen values (1,1),
(2,2),
(3,3),
(4,4),
(5,5);