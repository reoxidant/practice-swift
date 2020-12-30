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
    @IBOutlet var actionButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        button.isHidden = true
        
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        
        for btn in actionButton
        {
            btn.backgroundColor = .green
            btn.setTitleColor(.blue, for: .normal)
        }
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        label.font = .systemFont(ofSize: 35)
        
        if sender.tag == 0
        {
            label.isHidden = false
            label.text = "Hello World!"
            label.textColor = .red
            button.isHidden = false
        }
        else if sender.tag == 1
        {
            label.isHidden = false
            label.text = "Hey there!"
            label.textColor = .blue
            button.isHidden = false
        }
        else if sender.tag == 2
        {
            label.isHidden = true
            button.isHidden = true
        }
    }
}

