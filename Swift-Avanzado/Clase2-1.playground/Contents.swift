//: Playground - noun: a place where people can play

import UIKit

struct Empleado{
    var nombre:String
    var salario:Double
    enum Departamentos{
        case Ingenieria, Contabilidad, Mercadotecnia, Ventas, ninguno
    }
    var depto: Departamentos
    
    init(){
        self.nombre = "desconocido"
        self.salario = 0.0
        self.depto = .ninguno
    }
    
    mutating func impuestos(){
        
        let total = self.salario * 0.10
        print("Impuestos total = \(total)")
        self.salario = self.salario - total
    }
}

var godin = Empleado()
godin.salario = 9000.0
godin.impuestos()


