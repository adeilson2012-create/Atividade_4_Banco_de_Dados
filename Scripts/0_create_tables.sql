-- 1. Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS autofix_db;
USE autofix_db;

-- 2. Tabela CLIENTE (Entidade Forte)
CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(150)
);

-- 3. Tabela MECANICO (Entidade Forte)
CREATE TABLE MECANICO (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) -- Ex: Suspensão, Motor, Elétrica
);

-- 4. Tabela PECA (Entidade Forte)
CREATE TABLE PECA (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome_peca VARCHAR(100) NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    qtd_estoque INT NOT NULL DEFAULT 0
);

-- 5. Tabela VEICULO (Depende de Cliente)
CREATE TABLE VEICULO (
    placa VARCHAR(10) PRIMARY KEY, -- A placa é a chave primária
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50),
    ano_fabricacao INT,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

-- 6. Tabela ORDEM_SERVICO (Depende de Veículo e Mecânico)
CREATE TABLE ORDEM_SERVICO (
    numero_os INT AUTO_INCREMENT PRIMARY KEY,
    data_abertura DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Pendente', -- Pendente, Em Andamento, Concluído
    valor_total DECIMAL(10, 2),
    placa_veiculo VARCHAR(10) NOT NULL,
    id_mecanico_responsavel INT NOT NULL,
    FOREIGN KEY (placa_veiculo) REFERENCES VEICULO(placa),
    FOREIGN KEY (id_mecanico_responsavel) REFERENCES MECANICO(id_mecanico)
);

-- 7. Tabela Associativa ITEM_PECA (Depende de OS e Peça)
-- Resolve o relacionamento N:N e garante a normalização
CREATE TABLE ITEM_PECA (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    numero_os INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (numero_os) REFERENCES ORDEM_SERVICO(numero_os),
    FOREIGN KEY (id_peca) REFERENCES PECA(id_peca)
);