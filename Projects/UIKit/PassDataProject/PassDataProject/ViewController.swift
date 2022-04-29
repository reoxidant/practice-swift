//
//  ViewController.swift
//  PassDataProject
//
//  Created by Виталий Шаповалов on 24.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else {return}
        dvc.login = loginTF.text
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue){
        guard let svc = segue.source as? SecondViewController else {return}
        self.resultLabel.text = svc.label.text
    }
}
