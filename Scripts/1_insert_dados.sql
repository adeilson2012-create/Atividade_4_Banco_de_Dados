USE autofix_db;

-- 1. Inserindo Clientes
INSERT INTO CLIENTE (nome_completo, cpf, telefone, endereco) VALUES 
('Ana Pereira', '111.222.333-44', '(11) 91234-5678', 'Rua das Flores, 123'),
('Bruno Costa', '555.666.777-88', '(21) 99876-5432', 'Av. Central, 500'),
('Carla Dias', '999.888.777-66', '(31) 95555-4444', 'Praça da Sé, 10');

-- 2. Inserindo Mecânicos
INSERT INTO MECANICO (nome, especialidade) VALUES 
('Roberto Carlos', 'Motor'),
('Fernanda Souza', 'Elétrica'),
('João Borracheiro', 'Suspensão e Pneus');

-- 3. Inserindo Peças
INSERT INTO PECA (nome_peca, valor_unitario, qtd_estoque) VALUES 
('Óleo Sintético 5W30', 50.00, 100),
('Filtro de Óleo', 25.00, 50),
('Pastilha de Freio (Par)', 150.00, 20),
('Amortecedor Dianteiro', 300.00, 10),
('Lâmpada Farol H4', 20.00, 60);

-- 4. Inserindo Veículos (Vinculados aos Clientes)
INSERT INTO VEICULO (placa, modelo, marca, ano_fabricacao, id_cliente) VALUES 
('ABC-1234', 'Fiesta 1.6', 'Ford', 2015, 1),      -- Carro da Ana
('XYZ-9090', 'Civic LXR', 'Honda', 2018, 2),     -- Carro do Bruno
('GHI-5555', 'Onix LT', 'Chevrolet', 2020, 1);   -- Outro carro da Ana

-- 5. Inserindo Ordens de Serviço (Vinculadas a Veículos e Mecânicos)
INSERT INTO ORDEM_SERVICO (data_abertura, status, valor_total, placa_veiculo, id_mecanico_responsavel) VALUES 
('2023-11-01', 'Concluído', 225.00, 'ABC-1234', 1), -- Troca de óleo (Mecânico Roberto)
('2023-11-10', 'Em Andamento', 0.00, 'XYZ-9090', 2), -- Problema elétrico (Mecânica Fernanda)
('2023-11-14', 'Pendente', 0.00, 'GHI-5555', 3);    -- Revisão pneus (Mecânico João)

-- 6. Inserindo Itens nas OS (O que foi usado em cada serviço)
-- OS 1 (Fiesta): Usou 4 óleos e 1 filtro
INSERT INTO ITEM_PECA (numero_os, id_peca, quantidade) VALUES 
(1, 1, 4), -- 4x Óleo (4 * 50 = 200)
(1, 2, 1); -- 1x Filtro (1 * 25 = 25) -> Total 225.00

-- OS 2 (Civic): Usou 2 lâmpadas (ainda em andamento)
INSERT INTO ITEM_PECA (numero_os, id_peca, quantidade) VALUES 
(2, 5, 2);