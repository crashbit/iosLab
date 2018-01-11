//
//  ViewController.swift
//  TabBarController
//
//  Created by Germán Santos Jaimes on 1/9/18.
//  Copyright © 2018 iOS Develpment Lab. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prueba = Test1ViewController()
        let pruebaController = UINavigationController(rootViewController: prueba)
        
        pruebaController.tabBarItem.image = #imageLiteral(resourceName: "home_unselected")
        pruebaController.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_selected")
        navigationItem.title = "test"
        
        let prueba2 = Test2ViewController()
        let prueba2Controller = UINavigationController(rootViewController: prueba2)
        
        prueba2Controller.tabBarItem.image = #imageLiteral(resourceName: "like_unselected")
        prueba2Controller.tabBarItem.selectedImage = #imageLiteral(resourceName: "like_selected")
        
        tabBar.tintColor = .black
        
        viewControllers = [pruebaController, prueba2Controller]
        
    }

}

