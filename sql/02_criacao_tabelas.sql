USE moryne_industrial;

CREATE TABLE setor (
    id_setor INT NOT NULL AUTO_INCREMENT,
    nome_setor VARCHAR(60) NOT NULL,
    descricao VARCHAR(150),
    PRIMARY KEY (id_setor)
);

CREATE TABLE cargo (
    id_cargo INT NOT NULL AUTO_INCREMENT,
    nome_cargo VARCHAR(60) NOT NULL,
    salario_base DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_cargo),
    CHECK (salario_base >= 0)
);

CREATE TABLE funcionario (
    id_funcionario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    data_admissao DATE NOT NULL,
    id_setor INT NOT NULL,
    id_cargo INT NOT NULL,
    PRIMARY KEY (id_funcionario),
    FOREIGN KEY (id_setor) REFERENCES setor(id_setor),
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo)
);

CREATE TABLE fornecedor (
    id_fornecedor INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY (id_fornecedor)
);

CREATE TABLE materia_prima (
    id_materia_prima INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL,
    quantidade_estoque DECIMAL(10,2) NOT NULL DEFAULT 0,
    valor_unitario DECIMAL(10,2) NOT NULL,
    id_fornecedor INT NOT NULL,
    PRIMARY KEY (id_materia_prima),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor),
    CHECK (quantidade_estoque >= 0),
    CHECK (valor_unitario >= 0)
);

CREATE TABLE produto (
    id_produto INT NOT NULL AUTO_INCREMENT,
    nome_produto VARCHAR(80) NOT NULL,
    descricao VARCHAR(150),
    valor_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_produto),
    CHECK (valor_unitario >= 0)
);

CREATE TABLE produto_materia_prima (
    id_produto INT NOT NULL,
    id_materia_prima INT NOT NULL,
    quantidade_utilizada DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_produto, id_materia_prima),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_materia_prima) REFERENCES materia_prima(id_materia_prima),
    CHECK (quantidade_utilizada > 0)
);

CREATE TABLE maquina (
    id_maquina INT NOT NULL AUTO_INCREMENT,
    nome_maquina VARCHAR(80) NOT NULL,
    modelo VARCHAR(60),
    fabricante VARCHAR(80),
    data_aquisicao DATE,
    status VARCHAR(30) NOT NULL DEFAULT 'Operacional',
    id_setor INT NOT NULL,
    PRIMARY KEY (id_maquina),
    FOREIGN KEY (id_setor) REFERENCES setor(id_setor)
);

CREATE TABLE ordem_producao (
    id_ordem INT NOT NULL AUTO_INCREMENT,
    data_inicio DATE NOT NULL,
    data_previsao DATE,
    data_conclusao DATE,
    status VARCHAR(30) NOT NULL DEFAULT 'Planejada',
    id_funcionario INT NOT NULL,
    PRIMARY KEY (id_ordem),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE item_ordem_producao (
    id_item INT NOT NULL AUTO_INCREMENT,
    id_ordem INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_item),
    FOREIGN KEY (id_ordem) REFERENCES ordem_producao(id_ordem),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CHECK (quantidade > 0)
);

CREATE TABLE manutencao (
    id_manutencao INT NOT NULL AUTO_INCREMENT,
    data_manutencao DATE NOT NULL,
    tipo_manutencao VARCHAR(50) NOT NULL,
    descricao VARCHAR(200),
    custo DECIMAL(10,2) DEFAULT 0,
    id_maquina INT NOT NULL,
    id_funcionario INT NOT NULL,
    PRIMARY KEY (id_manutencao),
    FOREIGN KEY (id_maquina) REFERENCES maquina(id_maquina),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
    CHECK (custo >= 0)
);
