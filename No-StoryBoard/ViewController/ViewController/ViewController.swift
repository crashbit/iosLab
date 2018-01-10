//
//  ViewController.swift
//  TableView
//
//  Created by Germán Santos Jaimes on 1/8/18.
//  Copyright © 2018 iOS Develpment Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textLabel: UILabel = {
        var label = UILabel()
        label.text = "Esto es un Texto"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        view.addSubview(textLabel)
        
        textLabel.heightAnchor.constraint(equalToConstant: 140).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

