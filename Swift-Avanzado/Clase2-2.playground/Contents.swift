//: Playground - noun: a place where people can play

import UIKit

class Alumno{
    var calificacion: Int
    
    init?(calificacion: Int){
        self.calificacion = calificacion
        if self.calificacion < 0{
            return nil
        }
    }
    
    func suma(cals:[Int]) -> Int?{
        if cals.isEmpty{
            return nil
        }
        
        var resultado = 0
        for valor in cals{
            resultado += valor
        }
        return resultado
    }
}

var resultado2 = [2,3,4,5,10,7]

if let alumno = Alumno(calificacion: 3){
    print("Se creo el alumno")
    alumno.suma(cals: resultado2)
}else{
    print("Regreso nulo")
}


var resultado1 = [Int]()

var resultado3 = [-2,5,-3]

let alumno2 = Alumno(calificacion: 10)
alumno2?.suma(cals: resultado1)



