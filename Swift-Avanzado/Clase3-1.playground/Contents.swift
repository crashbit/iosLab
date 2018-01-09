//: Playground - noun: a place where people can play

import UIKit

var nombre:String? = "German"
var apellido:String? = "Gomez"


//if let nom = nombre, let ape = apellido{
//    print("\(nom), \(ape)")
//}

//
//
//_ = { () -> ()  in }
//
//_ = {(numero: Int) ->  Int in
//    return numero + 3
//}
//
//func sumatoria(valor: Int, sumaFunc:(Int) -> Int) -> Int{
//        return sumaFunc(valor)
//}
//
//let closure = {(valorNumero: Int ) -> Int in
//    return valorNumero + 10
//}
//
//sumatoria(valor: 5, sumaFunc: closure)
//
//sumatoria(valor:5, sumaFunc: {(valorNumero: Int) -> Int in return valorNumero + 5 })
//
//sumatoria(valor:5, sumaFunc: {(valorNumero) -> Int in return valorNumero + 5 })
//
//sumatoria(valor:5, sumaFunc: {(valorNumero) in return valorNumero + 5 })
//
//sumatoria(valor:5, sumaFunc: {valorNumero in return valorNumero + 5 })
//
//sumatoria(valor:5, sumaFunc: {return $0 + 5 })
//
//sumatoria(valor:5){return $0 + 5 }
//

var tupla:(nombre:String, edad:Int, estatura:Double) = ("German", 23, 178)

tupla.nombre = "Jose"

var alumno:(nombre:String, promedio:Double) = ("Jose", 6.8)

var (nombreAlumno, promedioAlumno) = alumno

print(nombreAlumno)

var var1 = alumno.nombre
let (var2, _) = alumno
var2
print(alumno)

//
//func funcion(){}
//
//let resultado = funcion()

