//
//  ViewController.swift
//  LifeCycleViewController
//
//  Created by Виталий Шаповалов on 16.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "startSegue" else { return }
        
        if let vc = segue.destination as? YellowViewController {
            vc.someProperties = "Hello world"
        }
    }
}

