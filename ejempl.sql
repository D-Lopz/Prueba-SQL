create table persona(
    id int auto_increment not null primary key,
    nombre varchar not null,
    edad int not null
);

create table curso(
    id int auto_increment not null primary key,
    nombre varchar not null
);

insert into persona(nombre, edad) values
('Juan', 45 );