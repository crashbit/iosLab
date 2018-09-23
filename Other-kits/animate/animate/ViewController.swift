//
//  ViewController.swift
//  animate
//
//  Created by Germán Santos Jaimes on 7/5/18.
//  Copyright © 2018 iosLab. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController {
    let test : SpringView = {
       let t = SpringView()
        t.backgroundColor = UIColor.blue
        return t
    }()
    
    let vista : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.blue
        return v
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(test)
        
        test.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        test.animation = "pop"
        test.curve = "easeOut"
        test.force = 2.7
        test.duration = 2.5
        test.delay = 1.0
        test.animate()
    }

}

