create database AlunoDisc;
use AlunoDisc;

create table aluno(
ra int primary key auto_increment,
nome varchar(40),
bairro varchar(30)
);

create table disciplina(
id_disc int primary key auto_increment,
nome varchar(40)
);

insert into aluno values(null,'Emilly','PQ.Sampaio'),
						(null,'Giovana','Vila P.'),
                        (null,'Brenno','PQ Sampaio'),
                        (null,'Leo','Guaianases'),
                        (null,'Italo','Guarulhos'),
                        (null,'Lusca','Carakas');
                        
insert into disciplina values(null,'ADS'),
							(null,'CSS'),
                            (null,'AC'),
                            (null,'CC');
                            
                            
create table semestre(
fk_aluno int,
foreign key(fk_aluno) references aluno(ra),
fk_disc int,
foreign key(fk_disc) references disciplina(id_disc),
primary key (fk_aluno, fk_disc, per_letivo),
quant_falta int,
per_letivo int,
media decimal
);


insert into semestre values (1,1,5,20192,9),
							(2,2,7,2019,6),
                            (3,1,30,2019,8),
                            (4,3,4,20192,7),
							(3,1,7,20192,8),
                            (4,3,0,2019,7),
                            (5,2,9,20192,5);
                            
select * from semestre;

select a.nome, d.nome, s.media from aluno as a, disciplina as d, semestre as s where a.ra = s.fk_aluno and  d.id_disc = s.fk_disc;                           
					
select * from aluno as a, disciplina as d, semestre as s where a.ra = s.fk_aluno and  d.id_disc = s.fk_disc;

select * from aluno as a, disciplina as d, semestre as s where a.ra = s.fk_aluno and  d.id_disc = s.fk_disc and a.nome = 'giovana';

select * from aluno as a, disciplina as d, semestre as s where a.ra = s.fk_aluno and  d.id_disc = s.fk_disc and per_letivo = 2019;

-- somando a quantidade de faltas 
select sum(quant_falta) from semestre;

-- somando as medias e as quantidades de faltas 
select sum(media) as 'Soma das médis', sum(quant_falta) as 'Soma das qtd de faltas' from semestre;

-- media da media
select avg(media) as 'Média das médias', avg(quant_falta) as 'Média das qtd de faltas' from semestre;

-- selecionar as medias de falta de um determinado aluno 
select avg(quant_falta) as 'Média das qtd de faltas', a.nome from semestre as s, aluno as a 
where a.ra = s.fk_aluno and a.nome = 'Emilly';

-- Exibir a média das médias com apenas 2 casas decimais 
select round(avg(media),2) as 'Média das médias', avg(quant_falta) as 'Média das qtd de faltas' from semestre;

-- exibir a maior e menor média da tabela semestre
select max(media) as 'Maior média', min(media) as 'Menos média' from semestre;

-- exibir a maior e menor qtd de faltes da tabela semestre
select max(quant_falta) as 'Maior quantidade de faltas', min(quant_falt) as 'Menos quantidade de faltas' from semestre;

-- Exibir a maior e menor média agrupada por disciplina
select fk_disc, max(media) as 'Menor média', min(media) as 'Menor média' from semestre group by fk_disc;

-- Exibir as médias diferentes da tabela semestre, não duplica as notas repetidas considera só uma
select distinct media from semestre;

-- Exibir a quantidade de medias da tabela semestre
select count(media) as 'Qtd médias' from semestre;



