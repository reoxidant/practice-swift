//
//  ViewController.swift
//  practiceUIButtonAndUILabel
//
//  Created by Виталий Шаповалов on 30.12.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        
        button.setTitle("Action", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .green
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        label.text = "Hello World!"
        label.font = .systemFont(ofSize: 35)
        label.isHidden = false
    }
    
}

