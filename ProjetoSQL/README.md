# Banco de Dados para Cenário de E-commerce - Documentação
Este repositório contém o código SQL para criação do banco de dados destinado a um cenário de e-commerce. O banco de dados foi projetado para armazenar informações relacionadas a clientes, produtos, pedidos, fornecedores, vendedores e outras entidades relevantes em um ambiente de comércio eletrônico.

## Configuração do Banco de Dados
### Criação do Banco de Dados
Antes de executar o código SQL, certifique-se de ter criado um banco de dados chamado ecommerce.


create database ecommerce;
use ecommerce;
## Criação das Tabelas
As seguintes tabelas foram criadas para armazenar os dados necessários:

- cliente: Armazena informações dos clientes, como nome, CPF, endereço, entre outros.
- produto: Contém informações sobre os produtos oferecidos no e-commerce.
- pedido: Registra detalhes dos pedidos feitos pelos clientes.
- produtoestoque: Mantém o estoque de produtos em diferentes localizações.
- fornecedor: Armazena informações sobre os fornecedores dos produtos.
- vendedor: Guarda informações sobre os vendedores que atuam no e-commerce.
- produtosvendedor: Relaciona os produtos oferecidos por cada vendedor.
- pedidoproduto: Associa produtos a pedidos e mantém o status de disponibilidade.
- localizacaoestoque: Associa produtos a locais de estoque.
- produtoFornecedor: Associa produtos a fornecedores e quantidades disponíveis.
### Inserção de Dados Iniciais
Para preencher as tabelas com dados iniciais, foram realizadas inserções de exemplo. Esses dados podem ser substituídos por informações reais posteriormente.

## Consultas de Exemplo
O código também inclui consultas de exemplo para ilustrar como obter informações do banco de dados:

Consulta que retorna a contagem total de clientes.
Consulta que lista o nome dos clientes e seus respectivos pedidos com status.
Consulta que mostra informações de vendedores e fornecedores relacionados.
Outras consultas de junção para recuperar informações relevantes.