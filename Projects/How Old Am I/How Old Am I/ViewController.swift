//
//  ViewController.swift
//  How Old Am I
//
//  Created by Виталий Шаповалов on 08.08.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateProgressBar()
    }
    
    @IBOutlet weak var progressBar: CircleProgressBar!
    
    func generateProgressBar(){
        progressBar.drawCircleProgressBar()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        progressBar.handlerButtonOnPress()
        print("got press")
    }
    
    @IBAction func buttonUpDown(_ sender: Any) {
        progressBar.handlerButtonUp()
    }
}
