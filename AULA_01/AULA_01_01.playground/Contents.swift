import UIKit

/* IMPLEMENTAÇÃO DE UM JOGO DE BINGO PARA PRATICAR OS CONCEITOS DA AULA 01:

 - var e let e suas inicializações
 - tipos de dados
 - print()
 - interpolação
 - operadores aritméticos e lógicos
 - if / else
 - operador ternario
 - typealias
 - array, dictionary
 - tuplas
 
 */

let tamanhoCartela = 10
var cartela: [Int] = []

// INICIA CARTELA DO JOGADOR COM UM PRIMEIRO NUMERO ALEATORIO
var possivelNumero = Int.random(in: 1...20)
cartela.append(possivelNumero)

possivelNumero = Int.random(in: 1...20)
var indiceCartela = 0

// COMPLETA A CARTELA EVITANDO NUMEROS REPETIDOS (tambem serve pra gerar jogo aleatorio da mega sena 😂)
repeat {
  while indiceCartela < cartela.count && possivelNumero != cartela[indiceCartela] {
      indiceCartela += 1
  }
  if indiceCartela == cartela.count {
    cartela.append(possivelNumero)
  }
  possivelNumero = Int.random(in: 1...20)
  indiceCartela = 0
} while cartela.count < tamanhoCartela

// TESTES
// print(cartela.count)
// print(cartela)
// cartela.sort()
// print(cartela)

// SORTEIA NUMEROS ALEATÓRIOS DE 1 A 20 E CONFERE SE A CARTELA GERADA COMPLETOU TODOS OS NUMEROS SORTEADOS. RETIRA DOS PROXIMOS SORTEIOS OS NUMEROS JÁ SORTEADOS ANTERIORMENTE

var numerosSorteados: [Int] = []
var indiceSorteados: Int

// INICIA O SORTEIO COM UM PRIMEIRO NUMERO ALEATORIO
possivelNumero = Int.random(in: 1...20)

print("COMECANDO")
print(" ")

// CONTINUA SORTEIO ATÉ UMA CARTELA SER FINALIZADA
repeat {
// VERIFICA SE O NUMERO SORTEADO JA FOI SORTEADO ANTERIORMENTE EM numerosSorteados
  indiceSorteados = 0
  while indiceSorteados < numerosSorteados.count && possivelNumero != numerosSorteados[indiceSorteados] {
    indiceSorteados += 1
  }
  // SE SIM, SORTEIA OUTRO NUMERO E VERIFICA NOVAMENTE
  if indiceSorteados < numerosSorteados.count && possivelNumero == numerosSorteados[indiceSorteados] {
    possivelNumero = Int.random(in: 1...20)
  }
  // SE NAO:
  else {
    print("SORTEANDO: \(possivelNumero)")
    // VERIFICA SE NUMERO EXISTE NAS CARTELAS
    indiceCartela = 0
    while indiceCartela < cartela.count && possivelNumero != cartela[indiceCartela] {
        indiceCartela += 1
    }
    // SE SIM: RETIRA NUMERO DA CARTELA, ADICIONA EM numerosSorteados, SORTEIA PROXIMO
    if indiceCartela < cartela.count && possivelNumero == cartela[indiceCartela] {
      cartela.remove(at: indiceCartela)

      print("CARTELA: \(cartela)")
      print(" ")
        
      numerosSorteados.append(possivelNumero)
      possivelNumero = Int.random(in: 1...20)
    }
    // SE NAO: ADICIONA EM numerosSorteados, SORTEIA PROXIMO
    else {
      numerosSorteados.append(possivelNumero)
      possivelNumero = Int.random(in: 1...20)
    }
  }
} while cartela.count > 0

// TESTES
// print(numerosSorteados)
// numerosSorteados.sort()
// print(numerosSorteados)

print(" ")
print("Jogador gritou BINGO! 🕺 após \(numerosSorteados.count) rodadas")
