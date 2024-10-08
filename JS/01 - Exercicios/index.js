/*-----------------Exercícios de fixação-------------------*/

const precoEtanol  = 3.29;
const precoGasolina = 6.29;
const kmPorLitro = 12;
const distancia = 15;
const tipoCombustivel = prompt('Qual o tipo de combustível? Digite "Etanol" ou "Gasolina"').toLowerCase();



const litrosConsumidos = distancia / kmPorLitro;

if(tipoCombustivel === 'Etanol'){
    const valorGasto = litrosConsumidos * precoEtanol;
    console.log('O valor gasto foi de R$ ' + valorGasto.toFixed(2));
} else {
    const valorGasto = litrosConsumidos * precoGasolina;
    console.log('O valor gasto foi de R$ ' + valorGasto.toFixed(2));
}

/*---------------Média Notas--------------------*/

const nota1 = 5;
const nota2 = 10;
const nota3 = 6;

const media = (nota1 + nota2 + nota3) / 3;
console.log('Média: ' + media.toFixed(2));


if(media < 5){
    console.log('Reprovado');
} else if(media >= 5 && media < 7){
    console.log('Recuperação');
} else {
    console.log('Aprovado');
}


/*-----------------Calculo de IMC-------------------*/

const peso = 105;
const altura = 1.67;

IMC = peso / (altura * altura);


if(IMC < 18.5){
    console.log('Abaixo do peso');
} else if(IMC >= 18.5 && IMC < 24.9){
    console.log('Peso normal');
} else if(IMC >= 25 && IMC < 29.9){
    console.log('Sobrepeso');
} else if(IMC >= 30 && IMC < 34.9){ 
    console.log('Obesidade grau 1');
} else if(IMC >= 35 && IMC < 39.9){
    console.log('Obesidade grau 2');
} else {
    console.log('Obesidade grau 3');
}

/*-----------------Calculo de Produto-------------------*/


const precoEtiqueta = 99.99;
const formaDePagamento = 1;

if(formaDePagamento === 1){
    console.log(precoEtiqueta - (precoEtiqueta * 0.1));
} else if(formaDePagamento === 2){
    console.log(precoEtiqueta - (precoEtiqueta * 0.15));
} else if(formaDePagamento === 3){
    console.log(precoEtiqueta);
} else if(formaDePagamento === 4){
    console.log(precoEtiqueta + (precoEtiqueta * 0.1));
} else {
    console.log('Forma de pagamento inválida');
}


