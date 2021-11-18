//
//  UserDetailsViewController.swift
//  NavigationApp
//
//  Created by hutzo on 12.10.2021.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = userName
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
