const numero = 5;
const numeroDivisivelPor5 = (numero % 5) === 0;

if (numero === 0){
    console.log("O número é inválido")
} else if (numero === 5){
    console.log("sim");
}else {
    console.log("Não")
}