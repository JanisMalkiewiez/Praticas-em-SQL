# criação da tabela

use base;

create table series(
	id_categoria int auto_increment primary key,
    nome_categoria varchar(50),
    nome_serie varchar(50),
    data_criacao date,
);

show tables;

insert into series(
	id_categoria, nome_categoria, nome_serie, data_criacao)
    values
    (1, 'Terror', 'Round 6', '2021-09-17'),
    (2, 'Drama Policial', 'La Casa de Papel', '2017-05-02'),
    (3, 'Drama Coreano', 'Pousando no Amor', '2019-12-14'),
    (4, 'Fantasia', 'Shadow Hunters', '2016-01-12'),
    (5, 'Suspense', 'Dark', '2017-12-01', 'Alemanha'),
    (6, 'Comédia', 'Café Minamdang','2022-06-27'),
    (7, 'Romance', 'Sorriso Real', '2023-06-17');

select * from series;