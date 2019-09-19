create database Alunos;
use Alunos;
create table alunos (
id_aluno int primary key auto_increment,
nome varchar (30),
email varchar(40)
);

create table notebook (
cod_note int primary key auto_increment,
fab varchar (10),
modelo varchar (10),
fk_aluno int,
foreign key (fk_aluno) references alunos(id_aluno)
) auto_increment = 100;

insert into alunos values (null,'Emilly','emy@'),
                          (null,'Lusca','lu@'),
                          (null,'Giovana','Gio@');
                          
insert into notebook values (null,'DELL','usto120',1),
                            (null,'HP','240',3); 
                            
select * from alunos, notebook where fk_aluno = id_aluno;

select alunos. *, cod_note, fab from alunos, notebook where fk_aluno = id_aluno;

update notebook set fk_aluno = 1 where cod_note = 100;

select * from alunos,notebook where fk_aluno = id_aluno and fab = 'DELL';


						  

