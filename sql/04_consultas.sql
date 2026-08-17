USE moryne_industrial;

-- 1. SELECT simples
SELECT * FROM produto;

-- 2. WHERE
SELECT nome_maquina, modelo, status
FROM maquina
WHERE status = 'Operacional';

-- 3. ORDER BY
SELECT nome_cargo, salario_base
FROM cargo
ORDER BY salario_base DESC;

-- 4. COUNT + GROUP BY
SELECT
    s.nome_setor,
    COUNT(f.id_funcionario) AS quantidade_funcionarios
FROM setor s
LEFT JOIN funcionario f
    ON s.id_setor = f.id_setor
GROUP BY s.id_setor, s.nome_setor;

-- 5. AVG, MAX e MIN
SELECT
    AVG(salario_base) AS salario_medio,
    MAX(salario_base) AS maior_salario,
    MIN(salario_base) AS menor_salario
FROM cargo;

-- 6. SUM + GROUP BY
SELECT
    p.nome_produto,
    SUM(iop.quantidade) AS quantidade_total
FROM item_ordem_producao iop
INNER JOIN produto p
    ON iop.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome_produto
ORDER BY quantidade_total DESC;

-- 7. INNER JOIN
SELECT
    f.nome AS funcionario,
    c.nome_cargo AS cargo,
    s.nome_setor AS setor
FROM funcionario f
INNER JOIN cargo c
    ON f.id_cargo = c.id_cargo
INNER JOIN setor s
    ON f.id_setor = s.id_setor
ORDER BY f.nome;

-- 8. LEFT JOIN
SELECT
    s.nome_setor,
    m.nome_maquina,
    m.status
FROM setor s
LEFT JOIN maquina m
    ON s.id_setor = m.id_setor
ORDER BY s.nome_setor;

-- 9. Múltiplas tabelas
SELECT
    op.id_ordem,
    p.nome_produto,
    iop.quantidade,
    op.status,
    f.nome AS responsavel
FROM ordem_producao op
INNER JOIN item_ordem_producao iop
    ON op.id_ordem = iop.id_ordem
INNER JOIN produto p
    ON iop.id_produto = p.id_produto
INNER JOIN funcionario f
    ON op.id_funcionario = f.id_funcionario
ORDER BY op.id_ordem;

-- 10. JOIN + GROUP BY + SUM
SELECT
    maq.nome_maquina,
    COUNT(m.id_manutencao) AS quantidade_manutencoes,
    SUM(m.custo) AS custo_total
FROM maquina maq
LEFT JOIN manutencao m
    ON maq.id_maquina = m.id_maquina
GROUP BY maq.id_maquina, maq.nome_maquina
ORDER BY custo_total DESC;
