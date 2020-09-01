//
//  ViewController.swift
//  swift-calculator
//
//  Created by Виталий Шаповалов on 13.08.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelNumber: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let calculator = Calculator.shared
        calculator.countNumbers()
    }
}

