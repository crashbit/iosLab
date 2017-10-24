import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

protocol Delegacion {
    func finalDelegado(clase:miClase)
}

class miClase {
    var delegate:Delegacion?
    
    func accion() {
        let _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.finAccion), userInfo: nil, repeats: false)
    }
    
    @objc func finAccion() {
        delegate?.finalDelegado(clase: self)
    }
}

class claseQueUsaAccion: Delegacion {
    func activaAccion() {
        let clase = miClase()
        clase.delegate = self
        clase.accion()
    }
    
    func finalDelegado(clase: miClase) {
        print("Se acabó la acción ejecutada")
        clase.delegate = nil
    }
}

let test = claseQueUsaAccion()
test.activaAccion()