USE moryne_industrial;

INSERT INTO setor (nome_setor, descricao) VALUES
('Produção', 'Responsável pelas atividades de fabricação dos produtos'),
('Manutenção', 'Responsável pela manutenção preventiva e corretiva das máquinas'),
('Qualidade', 'Responsável pela inspeção e controle da qualidade dos produtos'),
('Logística', 'Responsável pelo armazenamento e movimentação de materiais'),
('Administrativo', 'Responsável pelas atividades administrativas da empresa');

INSERT INTO cargo (nome_cargo, salario_base) VALUES
('Operador de Produção', 2800.00),
('Técnico de Manutenção', 3800.00),
('Inspetor de Qualidade', 3200.00),
('Auxiliar de Logística', 2500.00),
('Supervisor de Produção', 5200.00),
('Analista Administrativo', 3500.00);

INSERT INTO funcionario
(nome, cpf, data_nascimento, telefone, email, data_admissao, id_setor, id_cargo)
VALUES
('Carlos Henrique Silva', '123.456.789-01', '1990-05-15', '(11) 99999-1001', 'carlos@moryne.com', '2022-03-10', 1, 1),
('Marcos Vinicius Souza', '234.567.890-12', '1988-08-22', '(11) 99999-1002', 'marcos@moryne.com', '2020-06-15', 2, 2),
('Fernanda Oliveira', '345.678.901-23', '1995-11-03', '(11) 99999-1003', 'fernanda@moryne.com', '2023-01-20', 3, 3),
('Lucas Almeida', '456.789.012-34', '1998-02-17', '(11) 99999-1004', 'lucas@moryne.com', '2024-04-08', 4, 4),
('Ricardo Santos', '567.890.123-45', '1985-07-09', '(11) 99999-1005', 'ricardo@moryne.com', '2018-09-12', 1, 5),
('Juliana Martins', '678.901.234-56', '1993-12-21', '(11) 99999-1006', 'juliana@moryne.com', '2021-11-05', 5, 6);

INSERT INTO fornecedor
(razao_social, cnpj, telefone, email)
VALUES
('Aços Brasil Ltda.', '12.345.678/0001-10', '(11) 4002-1001', 'contato@acosbrasil.com'),
('Metal Forte Indústria Ltda.', '23.456.789/0001-21', '(11) 4002-1002', 'vendas@metalforte.com'),
('LubriTech Produtos Industriais', '34.567.890/0001-32', '(11) 4002-1003', 'comercial@lubritech.com'),
('Componentes Nacional Ltda.', '45.678.901/0001-43', '(11) 4002-1004', 'atendimento@componentesnacional.com');

INSERT INTO materia_prima
(nome, unidade_medida, quantidade_estoque, valor_unitario, id_fornecedor)
VALUES
('Aço Carbono', 'kg', 1500.00, 8.50, 1),
('Aço Inoxidável', 'kg', 800.00, 18.90, 1),
('Alumínio', 'kg', 650.00, 14.50, 2),
('Óleo Alumínio', 'litro', 200.00, 25.90, 3),
('Graxa Lubrificante', 'kg', 120.00, 32.50, 3),
('Parafuso Industrial', 'unidade', 3000.00, 1.20, 4);

INSERT INTO produto
(nome_produto, descricao, valor_unitario)
VALUES
('Engrenagem Industrial', 'Engrenagem utilizada em sistemas mecânicos industriais', 180.00),
('Eixo de Transmissão', 'Eixo metálico utilizado em equipamentos industriais', 350.00),
('Suporte Metálico', 'Suporte estrutural para montagem de máquinas', 120.00),
('Flange Industrial', 'Componente utilizado para conexão de tubulações e equipamentos', 210.00);

INSERT INTO produto_materia_prima
(id_produto, id_materia_prima, quantidade_utilizada)
VALUES
(1, 1, 2.50),
(1, 4, 0.10),
(2, 1, 4.00),
(2, 5, 0.15),
(3, 3, 3.00),
(3, 6, 4.00),
(4, 2, 2.80),
(4, 6, 6.00);

INSERT INTO maquina
(nome_maquina, modelo, fabricante, data_aquisicao, status, id_setor)
VALUES
('Torno CNC 01', 'TCN-500', 'MetalTech', '2020-03-15', 'Operacional', 1),
('Fresadora CNC 01', 'FC-300', 'Mecatron', '2021-07-10', 'Operacional', 1),
('Prensa Hidráulica 01', 'PH-100', 'HidraPress', '2019-11-05', 'Operacional', 1),
('Compressor Industrial', 'CI-50', 'ArMax', '2018-05-22', 'Em Manutenção', 2),
('Máquina de Medição', 'MM-200', 'Precision', '2022-09-18', 'Operacional', 3);

INSERT INTO ordem_producao
(data_inicio, data_previsao, data_conclusao, status, id_funcionario)
VALUES
('2026-08-01', '2026-08-05', '2026-08-04', 'Concluída', 5),
('2026-08-03', '2026-08-08', '2026-08-08', 'Concluída', 5),
('2026-08-06', '2026-08-12', NULL, 'Em Produção', 1),
('2026-08-10', '2026-08-16', NULL, 'Em Produção', 1),
('2026-08-15', '2026-08-22', NULL, 'Planejada', 5);

INSERT INTO item_ordem_producao
(id_ordem, id_produto, quantidade)
VALUES
(1, 1, 120),
(1, 3, 80),
(2, 2, 60),
(2, 4, 40),
(3, 1, 150),
(3, 2, 70),
(4, 3, 100),
(4, 4, 50),
(5, 1, 200),
(5, 4, 90);

INSERT INTO manutencao
(data_manutencao, tipo_manutencao, descricao, custo, id_maquina, id_funcionario)
VALUES
('2026-07-10', 'Preventiva', 'Troca de óleo e inspeção geral do Torno CNC 01', 450.00, 1, 2),
('2026-07-18', 'Preventiva', 'Lubrificação e verificação dos eixos da Fresadora CNC 01', 380.00, 2, 2),
('2026-07-25', 'Corretiva', 'Substituição de componente hidráulico da Prensa Hidráulica 01', 1250.00, 3, 2),
('2026-08-05', 'Corretiva', 'Reparo no sistema de compressão do Compressor Industrial', 980.00, 4, 2),
('2026-08-12', 'Preventiva', 'Calibração e verificação da Máquina de Medição', 320.00, 5, 3);
