create database faculdade;
use faculdade;

create table aluno(
ra int primary  key,
nome varchar(40),
telefone varchar(15)
);

create table projeto(
id_projeto int primary key auto_increment,
nome varchar(20),
descricao varchar(40)
);

create table acompanhante(
id_acomp int primary key auto_increment,
nome varchar(30),
tipo varchar(20)
);

insert into projeto values	(null,'imunodata','geladeira para armazenaemto de vacinas'),
							(null,'bengala','bengala pra cego'),
                            (null,'techgrao','armazenamento de graos');
					
insert into aluno values 	(01192085,'Emilly Santos','11923456433'),
							(01192087,'Leonardo','11967675675'),
                            (01192001,'Italo','1198789876');
                            
insert into acompanhante values	(null,'Marilandia','Mãe'),
								(null,'Samanta','Namorada'),
								(null,'Alan','Namorado');
                                
select * from aluno;
select * from projeto;
select * from acompanhante;


alter table aluno add column fk_projeto int;
alter table aluno  add foreign key(fk_projeto) references projeto(id_projeto);


update aluno set fk_projeto = 1 where ra = 01192085;
update aluno set fk_projeto = 2 where ra = 01192087;
update aluno set fk_projeto = 3 where ra = 01192001;

alter table aluno add column ra_representante int;
alter table aluno add foreign key (ra_representante) references aluno(ra);

update aluno set ra_representante = 01192085 where ra in (01192087,01192001);

alter table acompanhante add column fk_aluno int;
alter table acompanhante add foreign key (fk_aluno) references aluno(ra);

update acompanhante set fk_aluno = 01192085 where id_acomp = 1;
update acompanhante set fk_aluno = 01192087 where id_acomp = 2;
update acompanhante set fk_aluno = 01192001 where id_acomp = 3;


select * from aluno as a, projeto as p where p.id_projeto = a.fk_projeto;

select * from aluno, acompanhante where fk_aluno = ra;

select * from aluno where ra = ra_representante;

select * from aluno as a, projeto as p where a.fk_projeto = p.id_projeto and p.nome = 'imunodata';

select * from aluno, projeto, acompanhante where fk_projeto = id_pojeto and fk_aluno = ra;  

drop database faculdade;





