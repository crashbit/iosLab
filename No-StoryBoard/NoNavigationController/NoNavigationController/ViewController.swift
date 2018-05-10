//
//  ViewController.swift
//  NoNavigationController
//
//  Created by Germán Santos Jaimes on 5/9/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button : UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Click", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(showView), for: .touchUpInside)
        
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    @objc func showView(){
        let second = SecondViewController()
        present(second, animated: true, completion: nil)
        
    }
    

}

