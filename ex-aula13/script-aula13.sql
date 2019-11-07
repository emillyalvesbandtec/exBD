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
                                
insert into dependente values (null,'Marcelina','2001-08-23','filho',1),
								(null,'Joao','2005-02-09','filho',1),
                                (null,'Carlos','1975-08-10','conjuge',2),
                                (null,'Andre','1983-08-11','conjuge',3),
                                (null,'Gabriel','2001-02-16','comjuge',5),
                                (null,'Breno','1965-04-29','filho',6);

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
                            
                            
select * from engenheiro;

select * from dependente;

select * from obra;

select * from trabalha;

select * from engenheiro as e, dependente as d where e.id_engenheiro = d.fk_eng;

select * from engenheiro as e, dependente as d where e.id_engenheiro = d.fk_eng and e.nome_engenheiro = 'lucas';

select * from engenheiro as e, dependente as d where e.id_engenheiro = d.fk_eng and d.tipo = 'filho';

select * from engenheiro as e, obra as o, trabalha as t where t.fk_eng = e.id_engenheiro and t.fk_obra = o.id_obra;

select * from engenheiro as e, obra as o, trabalha as t where t.fk_eng = e.id_engenheiro and t.fk_obra = o.id_obra and o.nome = 'obra2';

select * from engenheiro as e, obra as o, trabalha as t where t.fk_eng = e.id_engenheiro and t.fk_obra = o.id_obra;

select e.*, o.*, t.quant_horas from engenheiro as e, obra as o, trabalha as t where t.fk_eng = e.id_engenheiro and t.fk_obra = o.id_obra;







