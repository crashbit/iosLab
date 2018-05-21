//
//  PartidoViewController.swift
//  CreaPartidos
//
//  Created by Germán Santos Jaimes on 5/10/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class PartidoViewController: UIViewController{
    
    ///// Local
    
    let localLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Local"
        lb.font = UIFont(name: "Arial", size: 40)
        lb.textAlignment = .left
        lb.backgroundColor = UIColor.red
        
        // Habilitamos el uso de constraints
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let localTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Local"
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    
    ////// Visitante
    
    let visitaLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Visitante"
        lb.font = UIFont(name: "Arial", size: 40)
        lb.textAlignment = .left
        lb.backgroundColor = UIColor.red
        
        // Habilitamos el uso de constraints
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let visitanteTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Visitante"
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    //// Boton
    let boton : UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Apuntar score", for: .normal)
        bt.backgroundColor = UIColor.red
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.addTarget(self, action: #selector(scorePartido), for: .touchUpInside)
        
        return bt
    }()
    
    

    
    //// Separador
    
    let separator : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.black
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        setupLayout()
    }
    
    func setupLayout(){
        view.addSubview(localTextField)
        view.addSubview(localLabel)
        
        view.addSubview(visitanteTextField)
        view.addSubview(visitaLabel)
        
        view.addSubview(boton)
        
        view.addSubview(separator)
        
        
        // el separador
        separator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        separator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        separator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        
        // Van los locales
        localLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        localLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        localLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        localLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        localTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        localTextField.topAnchor.constraint(equalTo: localLabel.bottomAnchor).isActive = true
        localTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        localTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Van los visitantes
        visitanteTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        visitanteTextField.bottomAnchor.constraint(equalTo: visitaLabel.topAnchor).isActive = true
        visitanteTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        visitanteTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        visitaLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visitaLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        visitaLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        visitaLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Boton
        boton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        boton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        boton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        boton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    @objc func scorePartido(){
        
        if let local = localTextField.text, let visitante = visitanteTextField.text{
            let scoreView = ScoreViewController()
            scoreView.local = local
            scoreView.visita = visitante
            self.navigationController?.pushViewController(scoreView, animated: true)
        }
    }
    

    
}
