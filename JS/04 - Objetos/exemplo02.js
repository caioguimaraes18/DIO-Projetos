class Carro {
    marca;
    modelo;
    ano;
    gastoCombustivel;


    constructor(marca, modelo, ano, gastoCombustivel,
    ) {
        this.marca = marca;
        this.modelo = modelo;
        this.ano = ano;
        this.gastoCombustivel = gastoCombustivel;
    }

    calcularConsumo(distanciaKm, precoCombustivel) {
        return distanciaKm * this.gastoCombustivel * precoCombustivel;
        
    }




}


const uno = new Carro('Fiat', 'Uno', 2020, 2);
const gol = new Carro('Volkswagen', 'Gol', 2020, 0.20);

console.log(uno.calcularConsumo(10, 10));