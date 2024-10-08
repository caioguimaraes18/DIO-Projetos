# Oficina - Sistema de Gerenciamento de Ordens de Serviço

O <bold>Oficina<bold/> é um projeto de sistema de gerenciamento de ordens de serviço para uma oficina mecânica. Ele permite o acompanhamento de clientes, veículos, serviços e ordens de serviço, bem como detalhes associados a cada ordem de serviço.

## Funcionalidades
O projeto consiste em um banco de dados MySQL com tabelas que armazenam informações essenciais para o funcionamento da oficina:

- Tabela Cliente: Armazena os dados dos clientes, como ID, nome, endereço, telefone e email.

- Tabela Veiculo: Mantém informações sobre os veículos, incluindo ID, modelo, marca e ano de fabricação.

- Tabela Servico: Guarda os tipos de serviços oferecidos, com detalhes como ID, descrição e preço.

- Tabela OrdemServico: Registra as ordens de serviço, com informações como ID, data, cliente associado e veículo relacionado.

- Tabela DetalhesOrdemServico: Armazena os detalhes específicos de cada ordem de serviço, como ID da ordem de serviço, ID do serviço associado e descrição adicional.

O projeto também inclui exemplos de inserção de dados nas tabelas Cliente, Veiculo, Servico e OrdemServico, bem como consultas SQL para demonstrar algumas funcionalidades do sistema:

- Listagem de clientes com seus IDs, nomes e telefones.
- Consulta para encontrar veículos de um determinado modelo (no exemplo, "Civic").
- Cálculo do valor total de uma ordem de serviço, somando os preços dos serviços associados.
- Listagem de clientes que fizeram mais de uma ordem de serviço.
- Detalhes de uma ordem de serviço específica, incluindo informações sobre o cliente, veículo, serviços e detalhes adicionais.