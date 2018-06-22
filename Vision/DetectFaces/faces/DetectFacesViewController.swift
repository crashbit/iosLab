//
//  DetectFacesViewController.swift
//  faces
//
//  Created by Germán Santos Jaimes on 6/1/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit
import Vision
import ImageIO


class DetectFacesViewController: UIViewController {
    
    var imageSelected: UIImage! {
        didSet {
            imageView.image = imageSelected
        }
    }
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "unknown")
        iv.translatesAutoresizingMaskIntoConstraints = false
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
        print("viewDidLoad")
        view.backgroundColor = UIColor.white
        
        imageView.image = imageSelected
        
        setupLayout()
    }
    
    func setupLayout(){
        view.addSubview(imageView)
        view.addSubview(resultsLabel)
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        resultsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        resultsLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        resultsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        
        //Usando modelos
        let leNetPlaces = GoogLeNetPlaces()
        var test: VNRequest!
        if let model = try? VNCoreMLModel(for: leNetPlaces.model){
            let mlRequest = VNCoreMLRequest(model: model, completionHandler: handleClassification)
            test = mlRequest
        }
        
        
        
        // 1
        guard let cgImage = imageSelected.cgImage else {
            print("can't create CIImage from UIImage")
            return
        }
        // 2
        let orientation = CGImagePropertyOrientation(rawValue: UInt32(imageSelected.imageOrientation.rawValue))
        // 3
        let faceRequest = VNDetectFaceRectanglesRequest(completionHandler: handleFaces)
        
        let request = VNDetectFaceLandmarksRequest(completionHandler: handleFaceLandmarksDetection)
        
        // 4
        let handler = VNImageRequestHandler(cgImage: cgImage, orientation: orientation!)
        // 5
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                // 6
                try handler.perform([faceRequest])
                try handler.perform([request])
                try handler.perform([test])
            } catch {
                print("Error handling vision request \(error)")
            }
        }
        
    }
    
    func handleFaces(request: VNRequest, error: Error?){
        // 1
        guard let observations = request.results
            as? [VNFaceObservation] else {
                print("unexpected result type from face request")
                return
        }
        DispatchQueue.main.async {
            // 2
            self.handleFaces(observations: observations)
        }
    }
    
    func handleFaces(observations: [VNFaceObservation]) {
        print("existen \(observations.count) rostros" )
        resultsLabel.text = "existen \(observations.count) rostros"
        for face in observations{
            let box1 = face.boundingBox
            let box2 = imageView.bounds
            
            let w = box1.size.width * box2.width
            let h = box1.size.height * box2.height
            
            let x = box1.origin.x * box2.width
            let y = abs((box1.origin.y * box2.height) -  box2.height) - h
            
            
            let subview = UIView(frame: CGRect(x: x, y: y, width: w, height: h))
            subview.layer.borderColor = UIColor.red.cgColor
            subview.layer.borderWidth = 3.0
            subview.tag = 5
            imageView.addSubview(subview)
            
        }
    }
    
    func handleFaceLandmarksDetection(request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNFaceObservation] else {
            fatalError("could not get results from request")
        }
        
        for face in observations {
            if let test1 = face.landmarks?.leftEye {
                for point in test1.normalizedPoints{
                    let cgPoint = CGPoint(x: CGFloat(point.x), y: CGFloat(1 - point.y))
                    dump(cgPoint)
                }
            }
            print("------------------------------------")
            if let test2 = face.landmarks?.rightEye{
                for point in test2.normalizedPoints{
                    let cgPoint = CGPoint(x: CGFloat(point.x), y: CGFloat(1 - point.y))
                    dump(cgPoint)
                }
            }
        }
    }
    
    func handleClassification(request: VNRequest, error: Error?){
        guard let observations = request.results as? [VNClassificationObservation] else {
            print("unexpected result type from VNCoreMLRequest")
            return
        }
        
        guard let bestResult = observations.first else {
            print("Did not a valid classification")
            return
        }
        
        DispatchQueue.main.async {
            print("Scene: '\(bestResult.identifier)' "
                + "\(bestResult.confidence)%")
        }
    }
    


}
