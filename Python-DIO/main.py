def sacar(valor):
    saldo = 5000
    if saldo >= valor:
        print('Saque realizado com sucesso')
    elif saldo < valor:
        print('Saldo insuficiente')
    else:
        print('Operação falhou')
 
 
def depositar(valor):
    saldo = 5000
    saldo += valor
    print('Depósito realizado com sucesso')
 
        
def extrato():
    saldo = 5000
    print(f'Seu saldo é: {saldo}')
    
def menu():
    print('1 - Sacar')
    print('2 - Depositar')
    print('3 - Extrato')
    print('4 - Sair')
    opcao = int(input('Escolha uma opção: '))
    return opcao

while True:
    menu_principal = menu()
    if menu_principal == 1:
        valor = float(input('Digite o valor do saque: '))
        sacar(valor)
    elif menu_principal == 2:
        valor = float(input('Digite o valor do depósito: '))
        depositar(valor)
    elif menu_principal == 3:
        extrato()
    elif menu_principal == 4:
        break
    else:
        print('Opção inválida')

