-- Relatório que mostra todos os pedidos e o nome de cada cliente
SELECT * FROM pedidos;
SELECT p.*, c.nome  FROM pedidos p INNER JOIN clientes c
ON p.cliente_id = c.cliente_id;
-- Salvar a consulta como uma VIEW / Relatório
CREATE VIEW vw_pedidos1 AS
SELECT p.*, c.nome  FROM pedidos p INNER JOIN clientes c
ON p.cliente_id = c.cliente_id;
-- Para ver o resultado
SELECT * FROM vw_pedidos1;