create database dbobra;
use dbobra;

create table engenheiro(
id_engenheiro int primary key auto_increment,
nome_engenheiro varchar(40),
cod_crea int,
salario int, 
sexo varchar (1), 
check (sexo = 'm' or sexo ='f' or sexo = 'n')
);


create table dependente(
id_dep int primary key auto_increment,
nome varchar(40),
data_nascimento date,
tipo varchar(10),
fk_eng int,
foreign key (fk_eng) references engenheiro(id_engenheiro)
);

create table obra(
id_obra int primary key auto_increment,
nome varchar(20),
endereco varchar(40) 
) auto_increment =1000;

create table trabalha(
fk_eng int,
foreign key(fk_eng) references engenheiro(id_engenheiro),
fk_obra int,
foreign key(fk_obra) references obra(id_obra),
quant_horas varchar(10)
);

insert into engenheiro values (null,'Franscisco',01,'3800','m'),
								(null,'Lucas',02,'2000','m'),
                                (null,'Marcela',03,'3000','f'),
                                (null,'Karina',04,'5000','f'),
                                (null,'Marcos',05,'6000','n'),
                                (null,'Jaque',06,'6000','f');
                                
insert into dependente values (null,'Marcelina','2001-08-23','filho'),
								(null,'Joao','2005-02-09','filho'),
                                (null,'Carlos','1975-08-10','conjuge'),
                                (null,'Andre','1983-08-11','conjuge'),
                                (null,'Gabriel','2001-02-16','comjuge'),
                                (null,'Breno','1965-04-29','filho');

insert into obra values (null,'obra1','Pq.Sampaio'),
						(null,'obra2','Vila P.'),
                        (null,'obra3','Guarulhos'),
                        (null,'obra4','Itapitanga'),
                        (null,'obra5','Itapevi');
                        
insert into trabalha values (1,1000,'08:50:00'),
							(2,1001,'10:03:40'),
                            (3,1002,'24:10:00'),
                            (4,1003,'90:10:00'),
							(5,1004,'50:40:00'),
                            (6,'1001','10:00:00');
                            
update dependente set fk_eng = 1 where id_dep = 1;
update dependente set fk_eng = 2 where id_engt = 1;
update dependente set fk_eng = 3 where id_eng = 6;
update dependente set fk_eng = 4 where id_eng = 4;
update engenheiro set fk_eng = 5 where id_eng = 5;
update engenheiro set fk_eng = 6 where id_eng = 3;



select * from engenheiro;

select * from obra;

select * from dependente;

select * from engenheiro as e join dependente as d on e.id_engenheiro = d.fk_eng;

select * from engenheiro as e join dependente as d on e.id_engenheiro = d.fk_eng where nome_engenheiro = 'Francisco';

select * from engenheiro as a join dependente as d on e.id_engenheiro = d.fk_eng where d.tipo = 'filho';

select * from engenheiro as a join obra as o join trabalha as t on e.id_engenheiro = t.fk_eng on o.id_obra = t.fk_obra;

select * from engenheiro as a join obra as o join trabalha as t on e.id_engenheiro = t.fk_eng on o.id_obra = t.fk_obra where o.nome = 'obra2';

select * from engenheiro as a join obra as o join trabalha as t join dependente as d on e.id_engenheiro = t.fk_eng on o.id_obra = t.fk_obra on d.fk_eng = e.id_engenheiro;

select * from engenheiro as e join dependente as d join obra as o join trabalha as t on e.id_engenheiro = d.fk_eng on o.id_obra = t.fk_obra on t.fk_eng = e.id_engenheiro where nome_engenheiro = 'Jaque';

select * from engenheiro as e join dependente as d join obra as o join trabalha as t on e.id_engenheiro = d.fk_eng on o.id_obra = t.fk_obra on t.fk_eng = e.id_engenheiro where nome_engenheiro = 'obra3';

select sum(salario) as 'Soma dos salarios' from engenheiro;

select avg(salario) as 'Média dos salários' from engenheiro;

select min(salario) as 'Menor salário', max(salario) as 'Maior salário' from engenheiro;

select distinct salario from engenheiro;

select distinct sum(salario) from engenheiro; 




