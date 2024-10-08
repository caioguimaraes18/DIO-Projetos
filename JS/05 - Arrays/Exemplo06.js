

const numeros =  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


let numerosPares = 0

for (let i = 0; i < numeros.length; i++) {
    const numero = numeros[i];
    if (numero % 2 === 0) {
        numerosPares = numerosPares + 1;
    }
}

console.log(numerosPares)

