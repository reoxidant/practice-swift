//
//  ViewController.swift
//  OutletsAndActions
//
//  Created by Виталий Шаповалов on 21.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet var labelCollection: [UILabel]!
    
    //if coping the button that reference also copied
    //outlet don't copy references if you copy outlet object
    
    @IBAction func buttonAction() {
        print("Hello World!")
        label.text = "Hello Masha!"
    }
    
    @IBAction func buttonPressed() {
        print(#function)
    }
    
}

