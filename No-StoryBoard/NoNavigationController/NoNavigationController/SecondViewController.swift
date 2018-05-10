//
//  SecondViewController.swift
//  NoNavigationController
//
//  Created by Germán Santos Jaimes on 5/9/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let button : UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("cerrar", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brown
        
        view.addSubview(button)
        
        button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    @objc func closeView(){
        dismiss(animated: true, completion: nil)
    }

   

}
