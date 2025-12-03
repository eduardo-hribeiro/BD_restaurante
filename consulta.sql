-- NOME E CATEGORIA DOS PRODUTOS ORDENADOS COM O PREÇO ACIMA 30 
select * from produtos;

SELECT nome, categoria 
FROM produtos 
WHERE preco > 30 
ORDER BY nome ASC;


-- NOME, TELEFONE E DATA DE NASCIMENTO DOS CLIENTES NASCIDOS ANTES DE 1985
select * from clientes;

SELECT nome, telefone, data_nascimento 
FROM clientes 
WHERE year(data_nascimento) < 1985 
ORDER BY data_nascimento DESC;


-- ID DO PRODUTO E INGREDIENTES QUE CONTÉM A PALAVRA "CARNE"
select * from info_produtos;

SELECT id_produto, ingredientes 
FROM info_produtos 
WHERE ingredientes LIKE '%carne%';


-- NOME E CATEGORIA DOS PRODUTOS ORDENADOS EM ORDEM ALFABÉTICA
select * from produtos;

SELECT nome, categoria 
FROM produtos 
ORDER BY categoria ASC, nome ASC;


-- OS 5 PRODUTOS MAIS CAROS
select * from produtos;

SELECT nome, preco 
FROM produtos 
ORDER BY preco DESC
LIMIT 5;


-- 2 PRATOS PRINCIPAIS EM PROMOÇÃO
select * from produtos;

SELECT nome, categoria 
FROM produtos 
WHERE categoria = 'Prato Principal'
LIMIT 2 OFFSET 6;


-- BACKUP DA TABELA PEDIDOS
CREATE TABLE backup_pedidos AS SELECT * FROM pedidos;