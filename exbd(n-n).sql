create database adsb;
use adsb;

create table alunos (
id_aluno int primary key auto_increment,
nome varchar (30),
email varchar(40)
);

create table notebook (
id_not int primary key auto_increment,
cod_not int,
fab varchar (10),
modelo varchar (10)
) auto_increment = 100;

create table log_notes(
fk_aluno int,
foreign key (fk_aluno) references alunos(id_aluno),
fk_not int,
foreign key (fk_not) references notebook(id_not)
);

insert into alunos values (null,'Emilly','emy@'),
                          (null,'Lusca','lu@'),
                          (null,'Giovana','Gio@');
                          
insert into notebook values (null,33,'DELL','usto120'),
                            (null,44,'HP','240'); 
                            
insert into log_notes value (1,100),
							(2,101),
                            (3,100);

select a.nome, n.modelo  from alunos as a, log_notes as l, notebook as n where a.id_aluno = l.fk_aluno and n.id_not = l.fk_not and modelo = '240'; 

select a.nome, n.modelo, n.fab from alunos as a, log_notes as l, notebook as n where a.id_aluno = l.fk_aluno and n.id_not = l.fk_not and fab = 'HP'; 

select nome, modelo, fab from alunos, log_notes, notebook where id_aluno = fk_aluno and id_not = fk_not and fab = 'HP';

