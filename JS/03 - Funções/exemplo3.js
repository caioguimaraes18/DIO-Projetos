// function escrevaSeuNome(nome) {
//     console.log('Meu nome é ' + nome);
// }


// function verificarIdade(idade) {
//     if (idade >= 18) {
//         console.log('Maior de idade');
//     }
//     else {
//         console.log('Menor de idade');
//     }
// }

// escrevaSeuNome('Fulano');
// verificarIdade(20);


// function cpfValido(cpf) {
//     if (cpf.length === 11) {
//         console.log('CPF válido');
//     }
//     else {
//         console.log('CPF inválido');
//     }
// }

// cpfValido('1234567');

/*-----------------Calculo de Etiqueta-------------------*/

const precoEtiqueta = 20;
const formaDePagamento = 4;


function calcularPreco(precoEtiqueta, formaDePagamento) {
    if (formaDePagamento === 1) {
        console.log(precoEtiqueta - (precoEtiqueta * 0.1));
    } else if (formaDePagamento === 2) {
        console.log(precoEtiqueta - (precoEtiqueta * 0.15));
    } else if (formaDePagamento === 3) {
        console.log(precoEtiqueta);
    } else if (formaDePagamento === 4) {
        console.log(precoEtiqueta + (precoEtiqueta * 0.1));
    } else {
        console.log('Forma de pagamento inválida');
    }
}

calcularPreco(precoEtiqueta, formaDePagamento);