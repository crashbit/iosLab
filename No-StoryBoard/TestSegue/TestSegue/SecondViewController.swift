//
//  SecondViewController.swift
//  TestSegue
//
//  Created by Germán Santos Jaimes on 1/11/18.
//  Copyright © 2018 iosLab. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        
        return button    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backButton)
        view.backgroundColor = UIColor.brown
        navigationItem.title = "Segundo"
        
        backButton.heightAnchor.constraint(equalToConstant: 140).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
    }
    
    @objc func handleBack(){
        let first = UIViewController()
        self.navigationController?.popViewController(animated: true)
      
        // Esta instrucción no conviene por ser la ultima pagina
        //self.navigationController?.pushViewController(first, animated: true)
        print("back")
    }
}
