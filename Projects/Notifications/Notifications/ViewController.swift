//
//  ViewController.swift
//  Notifications
//
//  Created by Виталий Шаповалов on 05.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        appDelegate?.scheduleNotification(notificationType: "Local Notification")
    }


}

