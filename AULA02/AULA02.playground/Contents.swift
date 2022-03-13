import UIKit

class Pilha {
    var elementos: [Int] = []
    var topoPilha = 0
    let tamanhoMaximo = 10
    
    func push(valor: Int) {
        if topoPilha < tamanhoMaximo {
            topoPilha += 1
            print("Empilhando: \(valor)")
            elementos.append(valor)
        }
        else {
            print("Não é possível empilhar mais. A pilha está cheia!")
        }
    }
    
    func pop() {
        if topoPilha > 0 {
            var elemento: Int
            elemento = elementos[topoPilha - 1]
            elementos.remove(at: topoPilha - 1)
            topoPilha -= 1
            print("Desempilhando \(elemento)")
            
        }
        else {
            print("Não é possível desempilhar. A pilha está vazia!")
        }
    }
}

var novaPilha = Pilha()

novaPilha.pop()
novaPilha.push(valor: 1)
novaPilha.push(valor: 2)
novaPilha.push(valor: 3)
novaPilha.push(valor: 4)
novaPilha.push(valor: 5)
novaPilha.push(valor: 6)
novaPilha.push(valor: 7)
novaPilha.push(valor: 8)
novaPilha.push(valor: 9)
novaPilha.push(valor: 10)
novaPilha.push(valor: 11)

novaPilha.pop()
novaPilha.pop()
novaPilha.pop()
novaPilha.pop()
novaPilha.pop()
novaPilha.pop()
novaPilha.pop()
novaPilha.pop()
novaPilha.pop()
novaPilha.pop()
novaPilha.pop()
