drop database if exists refugio;
create database refugio;
use refugio;

-- ubicación
create table pais (
	id int auto_increment primary key,
    nombre varchar(50)
);

create table provincia(
	id int auto_increment primary key,
    nombre varchar(50),
    id_pais int,
    constraint fk_provincia_pais foreign key (id_pais) references pais(id)
);

create table localidad (
	id int auto_increment primary key,
    nombre varchar(50),
    id_provincia int,
    constraint fk_localidad_provincia foreign key (id_provincia) references provincia(id)
);

create table direccion (
	id int auto_increment primary key,
    tipo_via  varchar(20),
    nombre varchar(50),
    num int,
    id_localidad int,
    constraint fk_direccion_localidad foreign key (id_localidad) references localidad(id)
);

-- herencia persona
create table persona (
    dni char(9) primary key,
    nombre varchar(100) not null,
    appelido1 varchar(100) not null,
    apellido2 varchar(100),
    id_direccion int not null,
    telefono char(9) not null,
    fecha_nac date not null,
    email varchar(255) not null,
    constraint chk_email_format check (locate('@', email) > 1),
    constraint fk_persona_direccion foreign key (id_direccion) references direccion(id)
);

create table usuario (
    dni_usuario char(9) primary key,
    tipo_participacion varchar(50) not null,
    constraint fk_usuario_persona foreign key (dni_usuario) references persona(dni)
);

create table empleado (
    dni_empleado char(9) primary key,
    salario decimal(10,2) not null,
    constraint fk_empleado_persona foreign key (dni_empleado) references persona(dni)
);
-- herencia empleado
create table cuidador (
    dni_cuidador char(9) primary key,
    titulo varchar(100) not null,
    constraint fk_cuidador_empleado foreign key (dni_cuidador) references empleado(dni_empleado)
);

create table gestor (
    dni_gestor char(9) primary key,
    constraint fk_gestor_empleado foreign key (dni_gestor) references empleado(dni_empleado)
);

create table raza(
	id int auto_increment primary key,
    nombre varchar(50),
    especie varchar(50)
);

create table animal(
	id int auto_increment primary key,
    animal varchar(50),
    raza int,
    edad int,
    estado_salud varchar(50),
    fecha_ingreso date,
    constraint fk_animal_raza foreign key (raza) references raza(id)
);

create table cuida(
	dni_cuidador char(9),
    id_animal int,
    fecha date,
    observaciones text,
    constraint pk_cuida primary key(dni_cuidador, id_animal, fecha),
    constraint fk_cuida_cuidador foreign key (dni_cuidador) references cuidador(dni_cuidador)
);

create table adopcion(
	id int auto_increment primary key,
    fecha date,
    dni_gestor char(9) not null,
    dni_usuario char(9) not null,
    id_animal int not null unique,
    constraint fk_adopcion_gestor foreign key(dni_gestor) references gestor(dni_gestor),
    constraint fk_adopcion_usuario foreign key(dni_usuario) references usuario(dni_usuario),
    constraint fk_adopcion_animal foreign key(id_animal) references animal(id)
);

create table pago(
	id int auto_increment primary key,
    importe decimal(6,2),
    id_adopcion int not null unique,
    constraint fk_pago_adopcion foreign key (id_adopcion) references adopcion(id)
);

create table entrega(
	id int auto_increment primary key,
    id_direccion int,
    dni_gestor char(9) not null,
    dni_usuario char(9) not null, 
    id_animal int not null,
    constraint fk_gestor_entrega foreign key (dni_gestor) references gestor(dni_gestor),
    constraint fk_usuario_entrega foreign key (dni_usuario) references usuario(dni_usuario),
    constraint fk_animal_entrega foreign key (id_animal) references animal(id),
    constraint fk_direccion_entrega foreign key (id_direccion) references direccion(id)
);