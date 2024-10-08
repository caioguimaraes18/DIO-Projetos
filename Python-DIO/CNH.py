#Faça um sistema de carteira de motorista


#Entrada de dados
# Entrada de dados
maior_idade = int(input("Digite sua idade: "))

# Verifica se a idade é maior ou igual a 18
if maior_idade >= 18:
    print("Você pode dirigir")
# Verifica se a idade é menor que 18
elif 16 <= maior_idade <= 17:
    print("Você pode dirigir com um responsável")
elif maior_idade < 18:
    print("Você não pode dirigir")
# Caso contrário, exibe uma mensagem de falha na operação
else:
    print("Operação falhou")

# Saída de dados
print("Fim do programa")


