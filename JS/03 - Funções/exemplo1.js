function incrementarJuros(valor, juros) {
    const valorComJuros = (juros/100) * valor;
    return valor + valorComJuros;
}


console.log(incrementarJuros(100, 50));
