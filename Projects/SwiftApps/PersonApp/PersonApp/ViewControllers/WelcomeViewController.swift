//
//  WelcomeScreenViewController.swift
//  PersonApp
//
//  Created by hutzo on 14.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var username: String!

    @IBOutlet weak var welcomeLabel: UILabel!
    
    let gradiendLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor, #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor]
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        gradiendLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradiendLayer, at: 0)

        // Do any additional setup after loading the view.
        
        if let name = username {
            welcomeLabel.text = "Welcome, \(name)!"
        }
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
