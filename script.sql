create database sportech;

use sportech;

create table usuarios(
idUsuario int primary key auto_increment,
nomeUsuario varchar(20),
sobrenome varchar(20),
email varchar(40),
senha varchar(30)
);

select * from usuarios;



