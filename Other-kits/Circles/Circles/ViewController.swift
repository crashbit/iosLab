//
//  ViewController.swift
//  Circles
//
//  Created by Germán Santos Jaimes on 7/5/18.
//  Copyright © 2018 iosLab. All rights reserved.
//

import UIKit
import MKRingProgressView

class ViewController: UIViewController {

    let ringProgressView  : MKRingProgressView = {
        let mkr  = MKRingProgressView()
        mkr.startColor = .red
        mkr.endColor = .blue
        mkr.ringWidth = 40
        mkr.progress = 0.0
        
        return mkr
    }()
    
    let etiqueta : UILabel = {
        let lb = UILabel()
        lb.text = "0"
        lb.font = UIFont(name: "Arial", size: 30)
        lb.textAlignment = .center
        
        // Habilitamos el uso de constraints
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(ringProgressView)
        view.addSubview(etiqueta)
        
        ringProgressView.frame = CGRect(x: view.frame.width/2 - 150 , y: view.frame.height/2 - 150, width: 300, height: 300)
        
        etiqueta.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        etiqueta.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        etiqueta.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        etiqueta.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        //        UIView.animate(withDuration: 2.5) {
        //            ringProgressView.progress = 0.8
        //        }
        ringProgressView.animateTo(72)
        etiqueta.animateTo(72)
    }

}

extension MKRingProgressView {
    func animateTo(_ number : Int) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        self.progress = Double(number)/100
        CATransaction.commit()
    }
}

extension UILabel {
    func animateTo(_ number: Int) {
        guard number > 0 else { return }
        let now = DispatchTime.now()
        
        for index in 0...number {
            let milliseconds = 10 * index
            let deadline : DispatchTime = now + .milliseconds(milliseconds)
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                self.text = "\(index)%"
            }
        }
    }
}
