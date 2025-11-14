-- A. Listar todas as peças com estoque baixo (menos de 30 unidades)
SELECT nome_peca, qtd_estoque 
FROM PECA 
WHERE qtd_estoque < 30 
ORDER BY qtd_estoque ASC;

-- B. Relatório de OS: Mostrar Data, Nome do Cliente, Modelo do Carro e Status
-- (Uso de JOIN para cruzar 3 tabelas)
SELECT 
    OS.data_abertura, 
    C.nome_completo AS Cliente, 
    V.modelo AS Veiculo, 
    OS.status
FROM ORDEM_SERVICO AS OS
JOIN VEICULO AS V ON OS.placa_veiculo = V.placa
JOIN CLIENTE AS C ON V.id_cliente = C.id_cliente;

-- C. Listar os Mecânicos e quantas OS cada um já assumiu
SELECT M.nome, COUNT(OS.numero_os) AS total_servicos
FROM MECANICO AS M
LEFT JOIN ORDEM_SERVICO AS OS ON M.id_mecanico = OS.id_mecanico_responsavel
GROUP BY M.nome;

-- 1. Atualizar o telefone de um cliente específico
UPDATE CLIENTE 
SET telefone = '(11) 99999-9999' 
WHERE id_cliente = 1;

-- 2. Atualizar o status e o valor de uma OS que foi finalizada
UPDATE ORDEM_SERVICO 
SET status = 'Concluído', valor_total = 40.00 
WHERE numero_os = 2;

-- 3. Dar baixa no estoque (simulação): Reduzir 4 unidades do óleo
UPDATE PECA 
SET qtd_estoque = qtd_estoque - 4 
WHERE id_peca = 1;


-- 1. Remover um item de peça que foi lançado errado na OS nº 2
DELETE FROM ITEM_PECA 
WHERE numero_os = 2 AND id_peca = 5;

-- 2. Deletar uma OS que foi criada por engano (ex: OS nº 3 que estava 'Pendente')
-- Nota: Se houver itens vinculados a ela, precisaria deletar os itens primeiro.
DELETE FROM ORDEM_SERVICO 
WHERE numero_os = 3;

-- 3. Deletar um mecânico que saiu da empresa (Somente se ele não tiver OS vinculadas)
DELETE FROM MECANICO 
WHERE nome = 'João Borracheiro';