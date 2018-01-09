//: Playground - noun: a place where people can play

import UIKit

struct Recepcionista{}
struct Enfermera {}
struct Doctor{}
struct Cirujano{}

protocol Payable{
    func calculaSueldo() -> Int
}

extension Payable{
    func calculaSueldo() -> Int{
        return 10000
    }
}

protocol SumunistraTratamiento{
    func tratamiento(nombre:String)
}

extension SumunistraTratamiento{
    func tratamiento(nombre:String){
        print("Estoy suministrando \(nombre)")
    }
}

protocol Capacitacion{
    func estudiar()
}

extension Capacitacion{
    func estudiar(){
        print("Viendo youtube")
    }
}

extension Recepcionista: Payable, Capacitacion{}
extension Enfermera: Payable, Capacitacion, SumunistraTratamiento{}

extension Doctor: Payable, Capacitacion, SumunistraTratamiento{}

var doctor = Doctor()
doctor.tratamiento(nombre: "paracetamol")
