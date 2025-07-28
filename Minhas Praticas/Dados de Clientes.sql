SET FOREIGN_KEY_CHECKS = 1;
-- DDL
drop table cliente;
drop table endereco;

create table cliente (
	codcliente integer primary key,
    nome varchar(50) not null,
    sexo char(1),
    estado_civil char(2)
    );
 
 create table endereco (
	codendereco integer primary key,
	logradouro varchar(50) not null,
    numero integer,
    cidade varchar(50),
    uf char(2),
    codcliente integer references cliente(codcliente)
);

alter table cliente 
	DROP estado,
	add uf char(2),
	add column sx char(2),
	rename column estadocivil to estado_civil,
	alter column estadocivil set default null;

-- DML 
insert into cliente (codcliente, nome, sexo, estado_civil)
values (1, 'Janis', 'F', 'S');

insert into cliente values (2, 'Maria', 'F', 'C');

insert into cliente (codcliente, nome) values (3, 'Pedro');

insert into endereco values (1, 'Quadra', 100, 'Brasilia', 'DF', 1),
(2, 'Rua', 200, 'Rio de Janeiro', 'RJ', 2), (3, 'Avenida', 300, 'Rio de Janeiro', 'RJ', 2);

# update cliente set cidade=null, uf=null

update cliente
set  sexo='M', estado_civil='C'
where codcliente = 3;

update cliente
set sx = sexo; -- Em caso de troca na coluna, fica salvo como cópia os valores antigos

delete from cliente 
where codcliente = 3; 

-- DQL
select nome from cliente; select * from cliente;
select codcliente, codendereco, cidade, uf from endereco;

select * from cliente
where sexo = 'F';

select * from cliente
where not estado_civil = 'S';

select * from cliente
where estado_civil <> 'S' and sexo = 'F';

select * from cliente
where nome = 'Maria';

select * from cliente
where nome like 'P%';

select * from cliente
where codcliente between 1 and  3;

select * from cliente where sexo = 'F'
order by nome desc;

select * from cliente
order by codcliente;

select * from cliente
order by sexo desc, nome;

select * from cliente, endereco
where cliente.codcliente = endereco.codcliente;

select * from cliente
inner join endereco ON
endereco.codcliente = cliente.codcliente;

select distinct c.nome, e.uf
from cliente as c
inner join endereco as e ON
e.codcliente = c.codcliente
where c.estado_civil = 'C'and e.uf = 'RJ';

select c.nome, e.uf
from cliente as c
left join endereco as e ON
e.codcliente = c.codcliente

union

select  e.uf, c.nome
from endereco as e
right join cliente as c ON
c.codcliente = e.codcliente;

select count(codcliente), min(codcliente), 
max(codcliente), sum(codcliente), avg(codcliente)
from cliente;

select sexo, estado_civil, count(codcliente) from cliente
group by sexo, estado_civil
having count(codcliente) > 1;

select cliente.nome, count(endereco.codendereco) as total_enderecos
from cliente left join endereco ON
endereco.codcliente = cliente.codcliente
group by cliente.nome
having total_enderecos > 1