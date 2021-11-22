//
//  AddTasksViewController.swift
//  swift-todo-list
//
//  Created by Виталий Шаповалов on 26.08.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class AddTasksViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var textField: UITextField!
    
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
    
    @IBAction func add(_ sender: Any){
        
        if UserDefaults.standard.object(forKey: "todoItems") != nil {
            array = UserDefaults.standard.object(forKey: "todoItems") as! [String]
        }
        
        array.append(textField.text!)
        UserDefaults.standard.set(array, forKey: "todoItems")
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
