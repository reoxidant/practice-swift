//
//  PersonViewController.swift
//  PersonList
//
//  Created by Виталий Шаповалов on 12.11.2021.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let person = person else { return }
        
        navigationItem.title = person.fullName
        
        phoneNumberLabel.text = "Phone: \(person.phoneNumber)"
        emailLabel.text = "Email: \(person.email)"
    }
}
