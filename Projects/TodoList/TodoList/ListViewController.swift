//
//  ListViewController.swift
//  swift-todo-list
//
//  Created by Виталий Шаповалов on 23.08.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit 

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var resultArray = [String]()
    
    override func viewDidLoad() {
       super.viewDidLoad()
       // Do any additional setup after loading the view.
       
       tableView.delegate = self
       tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if UserDefaults.standard.object(forKey: "todoItems") != nil {
            resultArray = UserDefaults.standard.object(forKey: "todoItems") as! [String]
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 70
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            resultArray.remove(at: indexPath.row)
            
            UserDefaults.standard.set(resultArray, forKey: "todoItems")
            tableView.reloadData()
        }
    }
    
}
