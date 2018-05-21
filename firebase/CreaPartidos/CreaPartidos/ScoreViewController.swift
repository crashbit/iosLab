//
//  ScoreViewController.swift
//  CreaPartidos
//
//  Created by Germán Santos Jaimes on 5/10/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class ScoreViewController: UIViewController {
    var ref : DatabaseReference!
    var handler : DatabaseHandle!
    
    var local : String! = nil
    var visita: String! = nil
    
    // Cosas del visitante
    let visitaLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Visita"
        lb.font = UIFont(name: "Arial", size: 20)
        lb.textAlignment = .center
        lb.backgroundColor = UIColor.red
        
        // Habilitamos el uso de constraints
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let scoreVisitaTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "0"
        tf.font = UIFont(name: "Arial", size: 50)
        tf.textAlignment = .center
        
        // Habilitamos el uso de constraints
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    // Cosas del local
    let localLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Local"
        lb.font = UIFont(name: "Arial", size: 20)
        lb.textAlignment = .center
        lb.backgroundColor = UIColor.blue
        
        // Habilitamos el uso de constraints
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let scoreLocalTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "0"
        tf.font = UIFont(name: "Arial", size: 50)
        tf.textAlignment = .center
        
        // Habilitamos el uso de constraints
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let boton : UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Actualizar score", for: .normal)
        bt.backgroundColor = UIColor.red
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.addTarget(self, action: #selector(actualizaScore), for: .touchUpInside)
        
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupLayout()
        
        ref = Database.database().reference()
        
        
        localLabel.text = local
        visitaLabel.text = visita
    }
    
    func setupLayout(){
        // agregamos nuestros elementos a la vista principal
        view.addSubview(visitaLabel)
        view.addSubview(localLabel)
        view.addSubview(scoreVisitaTF)
        view.addSubview(scoreLocalTF)
        view.addSubview(boton)
        
        // los colocamos
        visitaLabel.leftAnchor.constraint(equalTo: view.centerXAnchor  ).isActive = true
        visitaLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        visitaLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        visitaLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scoreVisitaTF.leftAnchor.constraint(equalTo: view.centerXAnchor  ).isActive = true
        scoreVisitaTF.topAnchor.constraint(equalTo: visitaLabel.bottomAnchor).isActive = true
        scoreVisitaTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        scoreVisitaTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        localLabel.rightAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        localLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        localLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        localLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scoreLocalTF.rightAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreLocalTF.topAnchor.constraint(equalTo: localLabel.bottomAnchor).isActive = true
        scoreLocalTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        scoreLocalTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        boton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        boton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        boton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        boton.heightAnchor.constraint(equalToConstant: 80)
    }
    
    @objc func actualizaScore(){
        let valuesLocal = ["nombre":local, "score":scoreLocalTF.text, "tipo":"local"] as [String : Any]
        let valuesVisitante = ["nombre":visita, "score":scoreVisitaTF.text, "tipo" : "visitante"] as [String : Any]
        let nodoPartidos = ["local":valuesLocal, "visitante":valuesVisitante]
        self.ref.child("partidos").updateChildValues(nodoPartidos) { (error, databaseRef) in
            if error != nil{
                print("error en base de datos")
                return
            }
            print("score actualizado")
        }
    }
    


}
