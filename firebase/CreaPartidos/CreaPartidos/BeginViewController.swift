//
//  ViewController.swift
//  CreaPartidos
//
//  Created by Germán Santos Jaimes on 5/10/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class BeginViewController: UIViewController {

    // 1 Creamos un boton que nos lleve a otra vista
    
    
    
    let boton : UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Crear partido", for: .normal)
        bt.backgroundColor = UIColor.red
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.addTarget(self, action: #selector(crearPartido), for: .touchUpInside)
        
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.white
        setupLayout()
    }

    func setupLayout(){
        view.addSubview(boton)
        
        boton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        boton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        boton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        boton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    @objc func crearPartido(){
        self.navigationController?.show(PartidoViewController(), sender: self)
    }
}

