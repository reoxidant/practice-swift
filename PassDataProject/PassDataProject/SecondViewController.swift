//
//  SecondViewController.swift
//  PassDataProject
//
//  Created by Виталий Шаповалов on 24.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var login: String?
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func goBackPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = self.login else {return}
        
        label.text = "Hello, \(login)"
    }
}
