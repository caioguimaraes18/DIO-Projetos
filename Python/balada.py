#Sistema de Balada 

def cadastro():
    nome = input('Digite seu nome: ')
    idade = int(input('Digite sua idade: '))
    cpf = input('Digite seu CPF: ')
    lista = [nome, idade, cpf]
    return lista

def ingresso():
    Valor = 0
    if idade >= 18:
        Valor = 50
    elif 16 <= idade <= 17:
        Valor = 40
    else:
        Valor = 30
    return Valor

def idade():
    if idade >= 18:
        print('Você pode entrar na balada')
    elif 16 <= idade <= 17:
        print('Você pode entrar na balada com um responsável')
    else:
        print('Você não pode entrar na balada')
        
def menu():
    print('1 - Cadastro')
    cadastro()
    print('2 - Ingresso')
    ingresso()
    print('3 - Idade')
    idade()
    print('4 - Sair')
    opcao = int(input('Escolha uma opção: '))
    return opcao

menu_principal = menu()