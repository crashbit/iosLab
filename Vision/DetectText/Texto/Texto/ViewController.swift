//
//  ViewController.swift
//  Texto
//
//  Created by Germán Santos Jaimes on 6/21/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {

    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "unknown")
        //iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor.red
        
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    let resultsLabel : UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont(name: "Arial", size: 20)
        lb.textAlignment = .center
        
        // Habilitamos el uso de constraints
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupLayout()
        
        self.findText()
    }
    
    func setupLayout(){
        view.addSubview(imageView)
        view.addSubview(resultsLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
//        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        resultsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        resultsLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        resultsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dump(self.imageView.bounds)
    }
    
    func findText(){
        dump(self.imageView.bounds.height )
        var textLayers : [CAShapeLayer] = []
        
        let textDetectionRequest = VNDetectTextRectanglesRequest(completionHandler: { (request, error) in
           
            guard let observations = request.results as? [VNTextObservation] else {
                fatalError("resultados inesperados")
            }
            dump(self.imageView.bounds.height )
            textLayers = self.addShapesToText(forObservations: observations, withImageView: self.imageView)
        })
        
        if let image = self.imageView.image, let cgImage = image.cgImage {
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            guard let _ = try? handler.perform([textDetectionRequest]) else {
                return print("No se pudo hacer la detección de texto")
            }
            
            for layer in textLayers {
               
                self.imageView.layer.addSublayer(layer)
            }
        }else{
            print("algo paso")
        }
        
    }
    
    func addShapesToText(forObservations observations: [VNTextObservation], withImageView textImageView: UIImageView) -> [CAShapeLayer] {
        
        let layers : [CAShapeLayer] = observations.map { observation in
            
            let w = observation.boundingBox.size.width * textImageView.bounds.width
            let h = observation.boundingBox.size.height * textImageView.bounds.height
            let x = observation.boundingBox.origin.x * textImageView.bounds.width
            let y = abs(((observation.boundingBox.origin.y * (textImageView.bounds.height)) - textImageView.bounds.height)) - h
            
            
            let layer = CAShapeLayer()
            layer.frame = CGRect(x: x, y: y, width: w, height: h)
            layer.borderColor = UIColor.red.cgColor
            layer.cornerRadius = 5
            layer.borderWidth  = 5
            
            return layer
            
        }
        return layers
    }


}

