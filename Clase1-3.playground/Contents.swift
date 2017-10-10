//: Playground - noun: a place where people can play

import UIKit

class Empleado{
    var sueldo: Double{
        willSet(nuevoSueldo){
            print("El sueldo cambia a \(nuevoSueldo)")
        }
        didSet{
            print("El sueldo cambio \(oldValue)")
        }
    }
    
    init(){
        self.sueldo = 0.0
    }
}

let godin = Empleado()
godin.sueldo = 300

https://github.com/crashbit/iosLab
