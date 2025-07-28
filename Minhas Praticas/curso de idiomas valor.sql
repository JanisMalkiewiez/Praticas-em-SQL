# criação da tabela

create table cursos(
	id_curso int auto_increment primary key,
    nome_curso varchar(50),
    valor_curso decimal(6, 2),
    data_criacao date
);

select * from cursos;

-- adicionando dados na tabela

insert into cursos(
	id_curso, nome_curso, valor_curso, data_criacao)
    values 
		(1, 'Inglês', 100, '2024-01-01'),
        (2, 'Espanhol', 50, '2024-02-05');
        
# Atualizando dados na tabela

SET SQL_SAFE_UPDATES=0;

update cursos
set valor_curso = 70
where id_curso = 2;

# apagando linhas da tabela
delete from cursos
where id_curso = 2;

# excluindo uma tabela

drop table cursos;