USE projeto_restaurante;

-- VIEW COM O RESUMO DO PEDIDO
SELECT * FROM itens_pedido;
CREATE VIEW resumo_pedido AS
SELECT pe.id_pedido, ip.quantidade, pe.data_pedido, c.nome AS cliente, c.email, f.nome AS funcionario, pr.nome AS produto, pr.preco
FROM pedidos AS pe
JOIN clientes AS c ON pe.id_cliente = c.id_cliente
JOIN funcionarios AS f ON pe.id_funcionario = f.id_funcionario
JOIN itens_pedido ip ON pe.id_pedido = ip.id_pedido
JOIN produtos AS pr ON ip.id_produto = pr.id_produto;

SELECT id_pedido, cliente, quantidade * preco AS total FROM resumo_pedido;


-- ATUALIZAR VIEW
CREATE OR REPLACE VIEW resumo_pedido AS
SELECT pe.id_pedido, ip.quantidade, pe.data_pedido, c.nome AS cliente, c.email, f.nome AS funcionario, pr.nome AS produto, pr.preco, (ip.quantidade * pr.preco) AS total
FROM pedidos AS pe
JOIN clientes AS c ON pe.id_cliente = c.id_cliente
JOIN funcionarios AS f ON pe.id_funcionario = f.id_funcionario
JOIN itens_pedido ip ON pe.id_pedido = ip.id_pedido
JOIN produtos AS pr ON ip.id_produto = pr.id_produto;

SELECT id_pedido, cliente, total FROM resumo_pedido;


-- CONSULTA COM USO DO EXPLAIN
EXPLAIN 
SELECT id_pedido, cliente, total FROM resumo_pedido;