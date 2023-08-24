CREATE DATABASE Oficina;
USE Oficina;


-- Criação da tabela Cliente
CREATE TABLE Cliente (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(200),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

-- Criação da tabela Veiculo
CREATE TABLE Veiculo (
    ID INT PRIMARY KEY,
    Modelo VARCHAR(50),
    Marca VARCHAR(50),
    AnoFabricacao INT
);

-- Criação da tabela Servico
CREATE TABLE Servico (
    ID INT PRIMARY KEY,
    Descricao VARCHAR(200),
    Preco DECIMAL(10, 2)
);

-- Criação da tabela OrdemServico
CREATE TABLE OrdemServico (
    ID INT PRIMARY KEY,
    Data DATE,
    ClienteID INT,
    VeiculoID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(ID)
);

-- Criação da tabela DetalhesOrdemServico
CREATE TABLE DetalhesOrdemServico (
    OrdemServicoID INT,
    ServicoID INT,
    DescricaoAdicional VARCHAR(200),
    PRIMARY KEY (OrdemServicoID, ServicoID),
    FOREIGN KEY (OrdemServicoID) REFERENCES OrdemServico(ID),
    FOREIGN KEY (ServicoID) REFERENCES Servico(ID)
);

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (ID, Nome, Endereco, Telefone, Email)
VALUES
    (1, 'João Silva', 'Rua A, 123', '123-4567', 'joao@email.com'),
    (2, 'Maria Santos', 'Avenida B, 456', '987-6543', 'maria@email.com'),
    (3, 'Carlos Oliveira', 'Rua C, 789', '555-1234', 'carlos@email.com'),
    (4, 'Ana Pereira', 'Rua D, 567', '111-2222', 'ana@email.com'),
    (5, 'Pedro Souza', 'Avenida E, 890', '444-3333', 'pedro@email.com');

-- Inserção de dados na tabela Veiculo
INSERT INTO Veiculo (ID, Modelo, Marca, AnoFabricacao)
VALUES
    (1, 'Civic', 'Honda', 2020),
    (2, 'Gol', 'Volkswagen', 2018),
    (3, 'Corolla', 'Toyota', 2019),
    (4, 'Onix', 'Chevrolet', 2021),
    (5, 'Uno', 'Fiat', 2017);

-- Inserção de dados na tabela Servico
INSERT INTO Servico (ID, Descricao, Preco)
VALUES
    (1, 'Troca de óleo', 50.00),
    (2, 'Revisão completa', 150.00),
    (3, 'Troca de pneus', 100.00),
    (4, 'Alinhamento e balanceamento', 80.00),
    (5, 'Lavagem completa', 30.00);

-- Inserção de dados na tabela OrdemServico
INSERT INTO OrdemServico (ID, Data, ClienteID, VeiculoID)
VALUES
    (1, '2023-08-01', 1, 1),
    (2, '2023-08-02', 2, 2),
    (3, '2023-08-03', 3, 3),
    (4, '2023-08-04', 4, 4),
    (5, '2023-08-05', 5, 5);

-- Inserção de dados na tabela DetalhesOrdemServico
INSERT INTO DetalhesOrdemServico (OrdemServicoID, ServicoID, DescricaoAdicional)
VALUES
    (1, 1, 'Utilizado óleo sintético'),
    (1, 3, 'Troca de todos os pneus'),
    (2, 2, 'Verificação de sistemas elétricos'),
    (2, 4, 'Realizado balanceamento'),
    (3, 5, 'Limpeza interna e externa'),
    (4, 1, 'Utilizado óleo mineral'),
    (5, 2, 'Substituição de filtro de ar');


SELECT ID, Nome, Telefone
FROM Cliente;

-- Filtro para encontrar veículos de um determinado modelo
SELECT Modelo, Marca, AnoFabricacao
FROM Veiculo
WHERE Modelo = 'Civic';

-- Cálculo do valor total de uma ordem de serviço
SELECT os.ID, SUM(s.Preco) AS ValorTotal
FROM OrdemServico os
JOIN DetalhesOrdemServico dos ON os.ID = dos.OrdemServicoID
JOIN Servico s ON dos.ServicoID = s.ID
GROUP BY os.ID;

-- Listagem de clientes que fizeram mais de uma ordem de serviço
SELECT c.ID, c.Nome, COUNT(os.ID) AS NumeroOrdens
FROM Cliente c
JOIN OrdemServico os ON c.ID = os.ClienteID
GROUP BY c.ID, c.Nome
HAVING COUNT(os.ID) > 1;

-- Detalhes de uma ordem de serviço com informações sobre os serviços realizados
SELECT os.ID, os.Data, c.Nome AS Cliente, v.Modelo AS Veiculo, s.Descricao AS Servico, dos.DescricaoAdicional
FROM OrdemServico os
JOIN Cliente c ON os.ClienteID = c.ID
JOIN Veiculo v ON os.VeiculoID = v.ID
JOIN DetalhesOrdemServico dos ON os.ID = dos.OrdemServicoID
JOIN Servico s ON dos.ServicoID = s.ID
WHERE os.ID = 1;




