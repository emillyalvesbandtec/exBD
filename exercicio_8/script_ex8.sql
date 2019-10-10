create database petshop;
use petshop;

create table pet (
id_pet int primary key auto_increment,
tipo varchar(10),
nome varchar (15),
raca varchar(10),
data_nascimento date
) auto_increment = 101;

create table cliente(
id_cliente int primary key auto_increment,
nome varchar(30),
telefone varchar(20),
sexo char(1),
bairro varchar(30),
fk_pet int,
foreign key(fk_pet) references pet(id_pet)
);

insert into cliente values 	(null,'Emilly Santos','11968164448','f','Pq.Sampaio Viana',101),
							(null,'Marilandia Santos','11987678767','f','São Matheus',102),
							(null,'Brenno Alves','11923234343','m','Vila Prudente',102),
							(null,'Ricardo','11987876765','m','Caracacity',103);
			
insert into pet values  (null,'cachorro','Belinha','vira lata','2012/08/20'),
						(null,'cachorro','Ted','pincher','2019/03/19'),
						(null,'gato','sherlock','atens','2012/11/17'),
						(null,'cachorro','frederico','labrador','2014/08/06'),
						(null,'cachorro','duck','malamute','2016/09/19');
                        
select * from pet;
select * from cliente;

alter table cliente modify column nome varchar(40);

select * from  pet where tipo = ('cachorro');

select nome, data_nascimento from pet;

select * from pet order by nome;

select * from cliente order by bairro desc;

select * from pet where nome like ('d%');

select * from cliente where nome like ('%santos');

update cliente set telefone = '11923454545' where id_cliente = 1;

select * from cliente;

select * from pet, cliente where id_pet = fk_pet;

select *  from cliente where sexo = 'f';

alter table cliente  drop column sexo;
 
update cliente set fk_pet = null where id_cliente = 1;  

delete from pet where id_pet = 101;

select * from pet;

drop table cliente;

drop table pet;


