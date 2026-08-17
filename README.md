# Sistema de Gerenciamento de Produção Industrial

Projeto acadêmico de banco de dados relacional desenvolvido para simular o gerenciamento de informações de uma empresa industrial fictícia.

## Objetivo

Centralizar e relacionar informações de setores, cargos, funcionários, fornecedores, matérias-primas, produtos, máquinas, ordens de produção e manutenções, utilizando modelagem relacional e comandos SQL.

## Tecnologias utilizadas

- MySQL Server 8.0.46
- MySQL Workbench 8.0.47 CE
- SQL

## Estrutura do banco

O projeto possui 11 tabelas:

- `setor`
- `cargo`
- `funcionario`
- `fornecedor`
- `materia_prima`
- `produto`
- `produto_materia_prima`
- `maquina`
- `ordem_producao`
- `item_ordem_producao`
- `manutencao`

## Relacionamentos principais

- Setor 1:N Funcionário
- Cargo 1:N Funcionário
- Setor 1:N Máquina
- Fornecedor 1:N Matéria-prima
- Produto N:N Matéria-prima, resolvido pela tabela `produto_materia_prima`
- Funcionário 1:N Ordem de produção
- Ordem de produção 1:N Item de ordem
- Produto 1:N Item de ordem
- Máquina 1:N Manutenção
- Funcionário 1:N Manutenção

## Recursos SQL utilizados

O projeto demonstra:

- `CREATE DATABASE`
- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `AUTO_INCREMENT`
- `NOT NULL`
- `UNIQUE`
- `DEFAULT`
- `CHECK`
- `INSERT INTO`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `COUNT`
- `SUM`
- `AVG`
- `MAX`
- `MIN`
- `INNER JOIN`
- `LEFT JOIN`

## Como executar

1. Abra o MySQL Workbench.
2. Execute `sql/01_criacao_banco.sql`.
3. Execute `sql/02_criacao_tabelas.sql`.
4. Execute `sql/03_insercao_dados.sql`.
5. Execute as consultas disponíveis em `sql/04_consultas.sql`.

## Observação

Todos os dados cadastrados são fictícios e foram criados exclusivamente para fins acadêmicos e de portfólio.

## Autor

Caio Moryne Martins Augusto
