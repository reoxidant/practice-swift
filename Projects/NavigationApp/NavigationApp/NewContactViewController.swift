//
//  NewContactViewController.swift
//  NavigationApp
//
//  Created by hutzo on 12.10.2021.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeButtonTap() {
        self.dismiss(animated: true, completion: nil)
    }
}
