create database adbs;
use adbs;

create table personal(
id_personal int primary key auto_increment,
nome varchar(40),
fk_orientador int,
foreign key(fk_orientador) references personal(id_personal)
);

insert into personal values (null,'Emilly',null),
							(null,'Giovana',1),
                            (null,'Leonardo',2),
                            (null,'João',1);

select tborientador.nome as orientador, tbpersonal.nome as personal from personal as tbpersonal, personal as tborientador 
where	tborientador.id_personal = tbpersonal.fk_orientador;
