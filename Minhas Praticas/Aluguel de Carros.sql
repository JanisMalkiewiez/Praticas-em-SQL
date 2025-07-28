CREATE TABLE clientes(
codclientes INTEGER PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cidade VARCHAR(50),
sexo CHAR(1),
uf CHAR(2),
estadocivil CHAR(2)
);

CREATE TABLE carro(
codcarro INTEGER PRIMARY KEY,
marca VARCHAR(30) NOT NULL,
modelo VARCHAR(30) NOT NULL
);

CREATE TABLE aluguel(
codaluguel INTEGER PRIMARY KEY,
codclientes INTEGER NOT NULL,
codcarro INTEGER NOT NULL,
FOREIGN KEY (codclientes) REFERENCES clientes (codclientes),
FOREIGN KEY (codcarro) REFERENCES carro (codcarro)
);


ALTER TABLE clientes 
    MODIFY COLUMN uf CHAR(2) AFTER cidade,
    MODIFY COLUMN cidade VARCHAR(100) DEFAULT NULL,
    MODIFY COLUMN idade INTEGER AFTER nome,
    MODIFY COLUMN cpf CHAR(14) AFTER idade,
    MODIFY COLUMN sexo CHAR(1) AFTER cpf;
    
 INSERT INTO clientes (codcliente, nome, idade, cpf, sexo, cidade, uf, estadocivil)
VALUES 
	(1, 'Ana', 25, '878.875.608-45', 'F', 'São Paulo', 'SP', 'S'),  (2, 'Bruno', 30, '585.740.477-08', 'M', 'Rio de Janeiro', 'RJ', 'C'),
    (3, 'Carla', 28, '674.940.096-55', 'F', 'Belo Horizonte', 'MG', 'C'), (4, 'Diego', 19, '075.465.629-29', 'M', 'Curitiba', 'PR', 'S'),
    (5, 'Elaine', 35, '620.855.000-99', 'F','Porto Alegre','RS','C'),  (6, 'Fernando', 40, '998.624.014-00','M','Recife', 'PE','S'); 
  
  
ALTER TABLE carro 
  ADD ano INTEGER,
  MODIFY COLUMN modelo VARCHAR(50) NOT NULL;

INSERT INTO carro (codcarro, marca, modelo, ano)
VALUES
	(1, 'Hyunday', 'HB20', '2012'), (2, 'Fiat', 'Argo', '2017'),
    (3, 'Volkswagen', 'Amarok', '2025'), (4, 'Citroën', 'Basalt', '2024'),
    (5, 'Nissan', 'Sentra', '2020'), (6, 'Honda', 'ZR-V', '2023');



ALTER TABLE aluguel 
  ADD valor_aluguel integer;
  
  
SHOW COLUMNS FROM carro;
SHOW COLUMNS FROM clientes;

SELECT * FROM carro;
SELECT * FROM clientes;