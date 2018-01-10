//
//  ViewController.swift
//  TableView
//
//  Created by Germán Santos Jaimes on 1/9/18.
//  Copyright © 2018 iOS Develpment Lab. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "celda")

        navigationItem.title = "esta es una tabla"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.lightGray
        }else{
            cell.backgroundColor = UIColor.darkGray
            cell.textLabel?.textColor = UIColor.white
        }
        
        cell.textLabel?.text = "testing"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    

}

