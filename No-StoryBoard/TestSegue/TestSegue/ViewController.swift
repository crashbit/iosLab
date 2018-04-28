//
//  ViewController.swift
//  TestSegue
//
//  Created by Germán Santos Jaimes on 1/11/18.
//  Copyright © 2018 iosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        
        return button    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        navigationItem.title = "Primero"

        view.addSubview(nextButton)
        
        nextButton.heightAnchor.constraint(equalToConstant: 140).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
    }
    
    @objc func handleNext(){
        
        let second = SecondViewController()
        self.navigationController?.pushViewController(second, animated: true)
        
    }

    


}

