//
//  NewContactViewController.swift
//  ContactsApp
//
//  Created by Виталий Шаповалов on 28.11.2021.
//

import UIKit

//protocol NewContactDelegate: AnyObject {
//    func saveContact(_ contact: Contact)
//}

protocol NewContactDelegate: AnyObject {
    // func saveContact(_ contact: String)
    func saveContact(_ contact: Contact)
}

class NewContactViewController: UIViewController {
    
    weak var delegate: NewContactDelegate?
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        firstNameField.addTarget(self, action: #selector(activateDoneButton), for: .editingChanged)
    }
    
    @objc private func activateDoneButton() {
        doneBarButton.isEnabled = firstNameField.text?.isEmpty ?? true ? false : true
    }
    
    @IBAction func didTabCancelBarButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func didTabDoneBarButton(_ sender: UIBarButtonItem) {
        let contact = Contact(name: firstNameField.text ?? "Maria", surname: lastNameField.text ?? "Sokolova")
        
        //StorageManager.shared.save(contact: contact.fullName)
        
        StorageManager.shared.save(contact: contact)
        
        //delegate?.saveContact(contact.fullName)
        delegate?.saveContact(contact)
        dismiss(animated: true)
    }
}
