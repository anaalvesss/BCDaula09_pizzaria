SELECT * FROM clientes;

DESCRIBE clientes;

SELECT * FROM clientes WHERE nome = 'Adelcio Biazi';
SELECT * FROM clientes WHERE nome LIKE 'Adelcio';
SELECT * FROM clientes WHERE nome LIKE '%Ana%';
SELECT * FROM clientes WHERE nome LIKE 'Ana%';

CREATE INDEX i_nome on clientes(nome);

DESCRIBE clientes;

SELECT * FROM clientes WHERE nome LIKE 'Ana%';
