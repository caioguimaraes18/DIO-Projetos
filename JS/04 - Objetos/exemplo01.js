/*-----------------Objetos-----------------*/

class Pessoa {
    nome;
    idade;
    cpf;
    anoNascimento;


    constructor(nome, idade, cpf, anoNascimento) {
        this.nome = nome;
        this.idade = idade;
        this.cpf = cpf;
        this.anoNascimento = new Date().getFullYear() - this.idade;
    }

    descrever() {
        console.log(`Nome: ${this.nome}, Idade: ${this.idade}, CPF: ${this.cpf} Ano de Nascimento: ${this.anoNascimento}`);
    }
}

const caio = new Pessoa('Caio G', 22, '12345678901', 1945);




const pessoa = {
    nome: 'Caio G',
    idade: 22,
    cpf: '12345678901',
    anoNascimento: new Date().getFullYear() - 22,
    
    descrever: function(){
        console.log(`Nome: ${this.nome}, Idade: ${this.idade}, CPF: ${this.cpf}, Ano de nascimento: ${this.anoNascimento}`);
    }


}


pessoa.descrever();


function compararPessoas(pessoa1, pessoa2){
   if (pessoa1.idade > pessoa2.idade){
         console.log(`${pessoa1.nome} é mais velho(a) que ${pessoa2.nome}`);
   } else if (pessoa1.idade < pessoa2.idade){   
        console.log(`${pessoa2.nome} é mais velho(a) que ${pessoa1.nome}`);
   } else {
        console.log(`${pessoa1.nome} e ${pessoa2.nome} tem a mesma idade`);
   }
}

const pessoa1 = new Pessoa('Caio G', 60, '12345678901');
const pessoa2 = new Pessoa('Maria', 49, '12345678901');

compararPessoas(pessoa1, pessoa2);