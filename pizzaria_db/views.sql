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

USE Pizzaria;

-- VIEW de exemplo: pedidos e nome dos clientes
CREATE VIEW vw_pedidos1 AS
SELECT p.*, c.nome
FROM pedidos p
INNER JOIN clientes c
ON p.cliente_id = c.cliente_id;

-- Desafio 1: pedidos, itens, nome dos clientes e nome das pizzas
CREATE VIEW vw_pedidos_itens AS
SELECT
    p.pedido_id,
    c.nome AS nome_cliente,
    pi.nome AS nome_pizza,
    ip.quantidade,
    ip.valor
FROM pedidos p
INNER JOIN clientes c
ON p.cliente_id = c.cliente_id
INNER JOIN itens_pedido ip
ON p.pedido_id = ip.pedido_id
INNER JOIN pizzas pi
ON ip.pizza_id = pi.pizza_id;

-- Desafio 2: pedidos com subtotal
CREATE VIEW vw_pedidos_subtotal AS
SELECT
    p.pedido_id,
    c.nome AS nome_cliente,
    pi.nome AS nome_pizza,
    ip.quantidade,
    ip.valor,
    (ip.valor * ip.quantidade) AS subtotal
FROM pedidos p
INNER JOIN clientes c
ON p.cliente_id = c.cliente_id
INNER JOIN itens_pedido ip
ON p.pedido_id = ip.pedido_id
INNER JOIN pizzas pi
ON ip.pizza_id = pi.pizza_id;

-- Desafio 3: valor total de cada pedido
CREATE VIEW vw_total_pedidos AS
SELECT
    pedido_id,
    SUM(valor * quantidade) AS valor_total
FROM itens_pedido
GROUP BY pedido_id;

-- Desafio 4: quantidade de pizzas em cada pedido
CREATE VIEW vw_quantidade_pizzas AS
SELECT
    pedido_id,
    SUM(quantidade) AS total_pizzas
FROM itens_pedido
GROUP BY pedido_id;

-- Consultar as VIEWS
SELECT * FROM vw_pedidos1;
SELECT * FROM vw_pedidos_itens;
SELECT * FROM vw_pedidos_subtotal;
SELECT * FROM vw_total_pedidos;
SELECT * FROM vw_quantidade_pizzas;