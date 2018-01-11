//
//  Test2ViewController.swift
//  TabBarController
//
//  Created by Germán Santos Jaimes on 1/10/18.
//  Copyright © 2018 iOS Develpment Lab. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController {

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        navigationItem.title = "dos"
        view.addSubview(loginButton)
        
        loginButton.heightAnchor.constraint(equalToConstant: 140).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
    }
    
    @objc func handleLogin(){
        print("saludos")
    }
}
