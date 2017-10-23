//: Playground - noun: a place where people can play

import UIKit

@objc protocol miProtocoloOpcional{
    func miFuncion()
    @objc optional var variable: Int { get }
    var var2:Int{ get }
}

protocol miProtocolo{
    mutating func miFuncion()
    var var2:Int{ get }
}

class MiClase: miProtocoloOpcional{
    var var2: Int = 0
    func miFuncion() {
        
    }
}

struct MiStruct:miProtocolo{
    var var2: Int = 0
    mutating func miFuncion() {
        self.var2 = 3
    }
}
