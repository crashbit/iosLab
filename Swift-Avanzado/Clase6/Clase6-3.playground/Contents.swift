//: Playground - noun: a place where people can play

import UIKit

protocol Protocolo{
    var propiedad: Int { get }
}

class Alumno:Protocolo{
    var propiedad:Int = 10
}

class Profesor: Protocolo{
    var propiedad: Int = 20
}

var proto = [Protocolo]()
let alumno = Alumno()
let profesor = Profesor()


proto.append(alumno)
proto.append(profesor)

for i in proto{
    print(i.propiedad)
}
