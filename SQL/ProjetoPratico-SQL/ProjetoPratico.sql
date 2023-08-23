-- Criação do Banco de Dados para o cenário de E-commerce

-- database if exists ecommerce;


create database ecommerce;
use ecommerce;

-- Criação de Tabelas


create table cliente(
	idCliente int auto_increment primary key, 
    Fname varchar(15),
    Minit char(3),
    Lname varchar(20),
    CPF char(11),
    CNPJ char(15),
    endereço varchar(40),
	constraint unique_cpf_cnpj unique (CPF, CNPJ)
);


create table produto(
	idProduto int auto_increment primary key, 
    Pname varchar(50) not null,
    classificação_criança bool default false,
    categoria enum('Eletrônico', 'Roupa', 'Brinquedos', 'Alimentos') not null,
   	avaliação float default 0,
    dimensão varchar(10)
);



create table pedido(
	idPedido int auto_increment primary key,
    idPedidoCliente int,  
    pedidoStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
	pedidoDescrição varchar(255),
    enviarValor float default 10, 
    pagamentoDinheiro boolean default false,
    constraint fk_pedido_cliente foreign key (idPedidoCliente) references cliente(idCliente)
	on update cascade
);



create table produtoestoque(
	idProdutoEstoque int auto_increment primary key,
	estoqueLocalização varchar(255),
    quantidade int default 0
);

create table fornecedor(
	idFornecedor int auto_increment primary key,
	NomeSocial varchar(255) not null,
    CNPJ char(15) not null,
    contato char(11) default 0,
    constraint unique_fornecedor unique (CNPJ)
);

create table vendedor(
	idVendedor int auto_increment primary key,
	NomeSocial varchar(255) not null,
    NomeFantasia varchar(255),
    CNPJ char(15),
    CPF char(9),
    Localidade varchar(255),
    contato char(11) default 0,
    constraint unique_cpnj_vendedor unique (CNPJ),
	constraint unique_cpf_vendedor unique (CPF)
);

create table produtosvendedor(
	idPvendedor int,
    idPproduto int,
    prodQuantidade int default 1,
    primary key(idPvendedor, idPproduto),
    constraint fk_produto_vendedor foreign key(idPvendedor) references vendedor(idVendedor),
    constraint fk_produto_produto foreign key(idPproduto) references produto(idProduto)
);

create table pedidoproduto (
    idPOproduto int,
    idPOpedido int,
    poQuantidade int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduto, idPOpedido),
    constraint fk_pedidoproduto_vendedor foreign key (idPOproduto) references produto(idProduto),
    constraint fk_pedidoproduto_pedido foreign key (idPOpedido) references pedido(idPedido)
);



create table localizacaoestoque(
	idLproduto int, 
	idLestoque int,
	localizacao varchar(255) not null,
	primary key (idLproduto, idLestoque),
	constraint fk_localizacao_estoque_vendedor foreign key (idLproduto) references produto(idProduto),
	constraint  fk_localizacao_estoque_produto foreign key (idLestoque) references produtoestoque(idProdutoEstoque)
);


create table produtoFornecedor(
idPfornecedor int,
idPproduto int,
quantidade int not null, 
primary key (idPfornecedor, idPproduto),
constraint fk_produto_fornecedor_fornecedor foreign key (idPfornecedor) references fornecedor (idFornecedor),
constraint fk_produto_fornecedor_produto foreign key (idPproduto) references produto(idProduto)
);


-- Tabela pagamento
create table pagamento (
    idPagamento int auto_increment primary key,
    idCliente int,
    tipoPagament enum('Boleto', 'Cartão', 'Dois cartões' ),
    limiteDisponivel float,
    constraint fk_pagamento_cliente foreign key (idCliente) references cliente(idCliente)
    on update cascade
	

);

-- Tabela entrega
create table entrega (
    idEntrega int auto_increment primary key,
    idPedido int,
    entregaStatus enum('Pendente', 'Em trânsito', 'Entregue') default 'Pendente',
    codigoRastreio varchar(50),
    constraint fk_entrega_pedido foreign key (idPedido) references pedido(idPedido)
    on update cascade
);

insert into cliente (Fname, Minit, Lname, CPF, CNPJ, endereço)
values
    ('João', 'M.', 'Silva', '12345678901', null, 'Rua A, 123'),
    ('Maria', 'A.', 'Santos', '98765432101', null, 'Avenida B, 456'),
    ('José', 'R.', 'Oliveira', '45678912301', null, 'Rua C, 789'),
    ('Ana', 'C.', 'Ferreira', '78912345601', null, 'Rua D, 987'),
    ('Carlos', 'S.', 'Pereira', '65432178901', null, 'Avenida E, 654'),
    ('Mariana', 'N.', 'Costa', null,'32165498701', 'Rua F, 321'),
    ('Pedro', 'A.', 'Almeida', '85296374101', null, 'Avenida G, 852'),
    ('Sofia', 'D.', 'Rodrigues', '14725836901', null, 'Rua H, 147'),
    ('Fernando', 'P.', 'Martins', '36914725801', null, 'Avenida I, 369'),
    ('Isabela', 'K.', 'Gomes', null,'25836914701', 'Rua J, 258'),
    ('Ricardo', 'S.', 'Nunes', '96385274101', null, 'Avenida K, 963'),
    ('Camila', 'M.', 'Rocha', '74185296301', null, 'Rua L, 741'),
    ('Luiz', 'G.', 'Lima', null,'25874136901', 'Avenida M, 258'),
    ('Amanda', 'V.', 'Sousa', null, '14796385201', 'Rua N, 147'),
    ('Felipe', 'B.', 'Cavalcanti', '96314785201', null, 'Avenida O, 963'),
    ('Lara', 'F.', 'Carvalho', null,'85274196301', 'Rua P, 852'),
    ('Guilherme', 'J.', 'Araújo', '36985214701', null, 'Avenida Q, 369'),
    ('Lívia', 'S.', 'Fonseca', '74136985201', null, 'Rua R, 741'),
    ('Rodrigo', 'T.', 'Barbosa', '12398745601', null, 'Avenida S, 123'),
    ('Beatriz', 'H.', 'Melo', '98765432102', null, 'Rua T, 987'),
    ('Rafael', 'L.', 'Ribeiro',  null, '78912345602', 'Avenida U, 789');

    
    -- Tabela produto
INSERT INTO produto (Pname, classificação_criança, categoria, avaliação, dimensão)
VALUES
    ('Smartphone', false, 'Eletrônico', 4.5, '15x7x0.9'),
    ('Camiseta', false, 'Roupa', 4.2, '40x30x2'),
    ('Carrinho de Controle Remoto', true, 'Brinquedos', 3.8, '25x15x10'),
    ('Biscoitos', false, 'Alimentos', 4.7, '20x15x5'),
    ('Fones de Ouvido', false, 'Eletrônico', 4.0, '10x10x2'),
    ('Calça Jeans', false, 'Roupa', 4.3, '50x40x5'),
    ('Boneca de Pelúcia', true, 'Brinquedos', 3.5, '30x20x10'),
    ('Chocolate', false, 'Alimentos', 4.8, '15x8x2'),
    ('Notebook', false, 'Eletrônico', 4.6, '30x20x2'),
    ('Jaqueta', false, 'Roupa', 4.1, '60x50x5');

-- Tabela pedido
INSERT INTO pedido (idPedidoCliente, pedidoStatus, pedidoDescrição, enviarValor, pagamentoDinheiro)
VALUES
    (1, 'Confirmado', 'Pedido de eletrônicos', 15.0, false),
    (2, 'Em processamento', 'Pedido de roupas', 12.0, true),
    (3, 'Confirmado', 'Pedido de brinquedos', 10.0, false),
    (4, 'Em processamento', 'Pedido de alimentos', 8.0, false),
    (5, 'Em processamento', 'Pedido de eletrônicos', 15.0, true),
    (6, 'Confirmado', 'Pedido de roupas', 12.0, false),
    (7, 'Em processamento', 'Pedido de brinquedos', 10.0, false),
    (8, 'Confirmado', 'Pedido de alimentos', 8.0, true),
    (9, 'Em processamento', 'Pedido de eletrônicos', 15.0, false),
    (10, 'Confirmado', 'Pedido de roupas', 12.0, true);

-- Tabela produtoestoque
INSERT INTO produtoestoque (estoqueLocalização, quantidade)
VALUES
    ('Prateleira A', 100),
    ('Prateleira B', 50),
    ('Caixa 1', 20),
    ('Caixa 2', 30),
    ('Prateleira C', 80),
    ('Prateleira D', 60),
    ('Caixa 3', 10),
    ('Caixa 4', 15),
    ('Prateleira E', 70),
    ('Prateleira F', 40);

-- Tabela fornecedor
INSERT INTO fornecedor (NomeSocial, CNPJ, contato)
VALUES
    ('Fornecedor Eletrônicos', '12345678901234', '1234567890'),
    ('Fornecedor Roupas', '56789012345678', '9876543210'),
    ('Fornecedor Brinquedos', '90123456789012', '4567890123'),
    ('Fornecedor Alimentos', '34567890123456', '7890123456');

-- Tabela vendedor
INSERT INTO vendedor (NomeSocial, NomeFantasia, CNPJ, CPF, Localidade, contato)
VALUES
    ('Loja de Eletrônicos', 'Eletrônicos Express', '12345678901234', '123456789', 'Cidade A', '9876543210'),
    ('Loja de Roupas', 'Moda Total', '56789012345678', '987654321', 'Cidade B', '1234567890'),
    ('Loja de Brinquedos', 'Brinquedolândia', '90123456789012', '456789012', 'Cidade C', '4567890123'),
    ('Mercado Alimentos', 'Super Food', '34567890123456', '789012345', 'Cidade D', '7890123456');

-- Tabela produtosvendedor
INSERT INTO produtosvendedor (idPvendedor, idPproduto, prodQuantidade)
VALUES
    (1, 1, 50),
    (2, 2, 100),
    (3, 3, 30),
    (4, 4, 200),
    (1, 5, 80),
    (2, 6, 150),
    (3, 7, 40),
    (4, 8, 120),
    (1, 9, 70),
    (2, 10, 90);

-- Tabela pedidoproduto
INSERT INTO pedidoproduto (idPOproduto, idPOpedido, poQuantidade, poStatus)
VALUES
    (1, 1, 2, 'Disponível'),
    (2, 2, 1, 'Sem estoque'),
    (3, 3, 3, 'Disponível'),
    (4, 4, 5, 'Sem estoque'),
    (5, 5, 2, 'Disponível'),
    (6, 6, 1, 'Sem estoque'),
    (7, 7, 4, 'Disponível'),
    (8, 8, 3, 'Sem estoque'),
    (9, 9, 1, 'Disponível'),
    (10, 10, 2, 'Disponível');

-- Tabela localizacaoestoque
INSERT INTO localizacaoestoque (idLproduto, idLestoque, localizacao)
VALUES
    (1, 1, 'Prateleira A'),
    (2, 2, 'Prateleira B'),
    (3, 3, 'Caixa 1'),
    (4, 4, 'Caixa 2'),
    (5, 5, 'Prateleira C'),
    (6, 6, 'Prateleira D'),
    (7, 7, 'Caixa 3'),
    (8, 8, 'Caixa 4'),
    (9, 9, 'Prateleira E'),
    (10, 10, 'Prateleira F');

-- Tabela produtoFornecedor
INSERT INTO produtoFornecedor (idPfornecedor, idPproduto, quantidade)
VALUES
    (1, 1, 100),
    (2, 2, 200),
    (3, 3, 150),
    (4, 4, 300),
    (1, 5, 120),
    (2, 6, 180),
    (3, 7, 100),
    (4, 8, 250),
    (1, 9, 90),
    (2, 10, 110);
    
    -- select * from pedido;
    
    select count(*) from cliente;
    
    select * from cliente c,  pedido p  where c.IdCliente = idPedidoCliente group by idPedido;
    
	select concat(Fname, ' ', Lname) as Cliente, idPedido as Pedido, pedidoStatus as Status from cliente c,  pedido p  where c.IdCliente = idPedidoCliente;

select * from cliente left outer join pedido on IdCliente = idPedidoCliente inner join produto;

SELECT v.idVendedor, CONCAT(v.NomeSocial, ' - ', v.NomeFantasia) AS NomeVendedor, f.idFornecedor, f.NomeSocial AS NomeFornecedor
FROM vendedor v
INNER JOIN fornecedor f ON v.CNPJ = f.CNPJ;

