//: Playground - noun: a place where people can play

import UIKit

protocol miProtocolo{
    var prop:Int{ get }
    
    func miFuncion()
}

protocol miProtocolo2: miProtocolo{
    func miFuncion2()
    init(arg:Int)
}

class MiClase: miProtocolo2{
    var prop = 0
    
    func miFuncion(){
        print("mi Funcion")
    }
    
    func miFuncion2() {
        
    }
    
    required init(arg: Int) {
    
    }
}

struct MiStruc: miProtocolo{
    var prop = 0
    func miFuncion() {
        
    }
}

enum MiEnum: miProtocolo{
    var prop: Int{
        get{ return 0}
    }
    
    func miFuncion(){
        
    }
    
    
}

let objeto = MiClase(arg: 3)
objeto.prop
