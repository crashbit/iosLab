//
//  ViewController.swift
//  DatosNoDatos
//
//  Created by Germán Santos Jaimes on 6/19/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        let reachability = Reachability()
        
        reachability?.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Hay datos via Wifi")
            }else {
                print("Hay datos via celular")
            }
        }
        
        reachability?.whenUnreachable = { _ in
            print("No hay datos")
        }
        
        do{
            try reachability?.startNotifier()
        }catch {
            print("No se puede iniciar las notificaciones")
        }
    }

}

