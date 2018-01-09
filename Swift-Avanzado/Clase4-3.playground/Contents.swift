//: Playground - noun: a place where people can play

import UIKit

class Alumno: CustomStringConvertible{
    var description: String{
        get{ return "Hola yo me llamo \(self.nombre)"}
    }
    
    var nombre:String
    
    init(nombre:String){
        self.nombre = nombre
    }
}

let alumno = Alumno(nombre: "German")

print(alumno)
