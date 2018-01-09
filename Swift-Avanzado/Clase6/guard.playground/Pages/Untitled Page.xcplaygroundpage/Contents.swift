//: Playground - noun: a place where people can play

import UIKit

protocol Saltable{
    var fuerza: Int { get }
}

extension Saltable{
    func saltar() -> Int{
        return self.fuerza * 10;
    }
}

class Alumno: Saltable{
    var fuerza: Int = 10
}

extension Alumno{
    func seMatematicas(){
        print("Yo se matematicas")
    }
}

extension Int{
    func cuadrado() -> Int{
        return self * self
    }
}

let paw = Alumno()
paw.seMatematicas()
paw.saltar()

var edad: Int = 10;

edad.cuadrado()
