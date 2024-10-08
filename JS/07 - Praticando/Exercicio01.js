// Faça um programa que recebe N (quantidade de números) e seus respectivos valores, e exibe a média dos números digitados.
// Imprima o maior número par digitado e menor número impar.

// Exemplo:

//     Entrada: 5 1 2 3 4 10
//     Saida: 10

const gets = () => {
    return '5 100 2 3 4 10 22';
}

const n = 5;

for (let i = 0; i < 1; i++) {
    const numbers = gets().split(' ').map(Number);
    const pares = numbers.filter(num => num % 2 === 0);
    const impares = numbers.filter(num => num % 2 !== 0);
    const media = numbers.reduce((acc, num) => acc + num, 0) / n;
    const maiorPar = Math.max(...pares);
    const menorImpar = Math.min(...impares);
    console.log(maiorPar);

}
