//: Playground - noun: a place where people can play

import UIKit

class Alumno{
    var edad = 23
    var nombre = "German"
}

class Profesor{
    var edad: Int
    var nombre: String
    
    init(edad: Int, nombre: String) {
        self.edad = edad
        self.nombre = nombre
    }
    
    init(){
        self.edad = 0
        self.nombre = "donNadie"
    }
    
    func daClase(){
        print("Da clase")
    }
}

let profesor = Profesor(edad:23, nombre:"Pedro")
let profesor2 = Profesor()

profesor.daClase()
profesor.nombre = "German"
