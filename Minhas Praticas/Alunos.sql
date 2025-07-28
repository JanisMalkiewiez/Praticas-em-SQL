SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE aluno (
	id_aluno INTEGER PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    uf CHAR(2)
    );
    
CREATE TABLE boletim(
	id_boletim INTEGER PRIMARY KEY,
	id_turma INTEGER,
	id_aluno INTEGER REFERENCES aluno(id_aluno),
	nota NUMERIC(2,1)
    );
    
    
INSERT INTO aluno VALUES 
	(1, 'JOSE', 'DF'), (2, 'JANIS', 'MG'),
	(3, 'MARIA', 'SP'), (4, 'JOAO', 'RJ'),
	(5, 'BEATRIZ', 'SC');

INSERT INTO boletim VALUES
 (2,1,2,5), (3,2,3,6),(4,2,4,4), (5,2,5,8);

INSERT INTO boletim VALUES (1,1,1,7);

INSERT INTO aluno VALUES (6,'CARLOS','DF');

SELECT id_aluno, nota FROM boletim    
WHERE nota > (SELECT AVG(nota) FROM boletim);

SELECT * FROM aluno;
SELECT DISTINCT id_turma FROM boletim;

SELECT id_aluno FROM boletim
WHERE id_turma = 1
AND id_aluno IN (SELECT id_aluno FROM aluno WHERE uf = 'DF');

SELECT * FROM aluno WHERE uf = 'DF'
UNION
SELECT * FROM aluno WHERE uf = 'RJ';

SELECT nome_aluno FROM aluno
WHERE nome_aluno IN (SELECT nome_aluno FROM aluno WHERE uf = 'RJ');

ALTER VIEW vw_boletim AS
SELECT boletim.id_turma, aluno.id_aluno, aluno.nome_aluno, aluno.uf, boletim.nota
FROM boletim
INNER JOIN aluno ON
aluno.id_aluno = boletim.id_aluno;

SELECT * FROM vw_boletim