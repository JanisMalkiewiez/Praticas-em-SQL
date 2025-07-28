CREATE TABLE `meu_banco`.`vendas` (
id INT PRIMARY KEY,
valor NUMERIC
);

INSERT INTO vendas (id, valor)
VALUES (1, 100), (2, 200), (3, 300), (4, 400),(5, 500),
(6, 600), (7, 700), (8, 800), (9, 900), (10, 1000);

WITH cte AS (
	SELECT
		valor,
        PERCENT_RANK() OVER (ORDER BY valor) AS percentil
    FROM vendas    
)
SELECT
	MAX(CASE WHEN percentil <= 0.25 THEN valor END) AS Q1,
    MAX(CASE WHEN percentil <= 0.75 THEN valor END) AS Q3
FROM cte
)
SELECT 
	Q1,
	Q3,
	Q3 - Q1 AS IQR
	Q1 - 1.5 * (Q3 - Q1) AS limite_inferior,
		Q3 + 1.5 * (Q3 - Q1) AS limite_superior
FROM quartis;
)
SELECT 
	v.valor,
	iqr.Q1,
	iqr.Q3,
	iqr.IQR,
	iqr.limite_inferior,
	iqr.limite_superior,
	CASE 
		WHEN v.valor < iqr.limite_inferior OR v.valor > iqr.limite_superior THEN 'Outlier'
		ELSE 'Normal'
	END AS classificacao
FROM vendas v
CROSS JOIN iqr_calc iqr;
