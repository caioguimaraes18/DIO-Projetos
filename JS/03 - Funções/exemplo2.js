function calcularIMC(peso, altura){
    return peso / Math.pow(altura, 2);
}

function classificarIMC(IMC){
    
if(IMC < 18.5){
   return('Abaixo do peso');
} else if(IMC >= 18.5 && IMC < 24.9){
   return('Peso normal');
} else if(IMC >= 25 && IMC < 29.9){
   return('Sobrepeso');
} else if(IMC >= 30 && IMC < 34.9){ 
   return('Obesidade grau 1');
} else if(IMC >= 35 && IMC < 39.9){
   return('Obesidade grau 2');
} else {
   return('Obesidade grau 3');
}
}

function main () {
    const peso = 48;
    const altura = 1.67;
    const IMC = calcularIMC(peso, altura);
    console.log(classificarIMC(IMC));

}

main();



