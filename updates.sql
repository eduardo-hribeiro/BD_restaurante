USE projeto_restaurante;
-- ATUALIZAR ID PEDIDO 6 PARA VAZIO
select * from pedidos;

UPDATE pedidos
SET status = NULL 
WHERE id_pedido = 6;


-- ATUALIZAR O CARGO DE UM FUNCIONÁRIO
select * from funcionarios;

UPDATE funcionarios
SET id_cargo = 6, salario = 2700
WHERE id_funcionario = 4;


-- ATUALIZAR STATUS DE PEDIDOS ANTERIORES A UMA DATA 
/*SET SQL_SAFE_UPDATES = 0; */
select * from pedidos;

UPDATE pedidos
SET status = 'Concluído'
WHERE data_pedido < '2024-07-06';


-- DELETAR FUNCIONÁRIO (DESDE QUE NÃO TENHA FK ATIVA)
select * from funcionarios;

DELETE FROM funcionarios
WHERE id_funcionario = 2;


-- ATUALIZAR VALOR TOTAL DO PEDIDO BASEADO NOS ITENS

UPDATE pedidos p
JOIN (
	SELECT id_pedido, SUM(quantidade * preco_unitario) AS total
	FROM itens_pedido
	GROUP BY id_pedido
) t ON p.id_pedido = t.id_pedido
SET p.valor_total = t.total;


-- DEFINIR STATUS NULL COMO CANCELADO
/*SET SQL_SAFE_UPDATES = 0; */

UPDATE pedidos
SET status = 'Cancelado'
WHERE status IS NULL;


-- EXEMPLO DE AJUSTE DE PREÇO EM PRODUTOS

UPDATE produtos
SET preco = preco * 1.10
WHERE categoria = 'Prato Principal';