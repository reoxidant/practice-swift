//
//  NewContactViewController.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 27.12.2021.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    
    var presenter: NewContactPresenterProtocol!
    
    @IBAction func saveButtonPressed() {
        let name = nameTextField.text ?? ""
        let surname = surnameTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        
        let imageData = UIImage(systemName: "person")?.pngData()
        
        let person = Person(name: name, surname: surname, phone: phone,
            imageData: imageData
        )
        
        presenter.savePerson(person: person)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
}

extension NewContactViewController: NewContactViewProtocol {
    func failure() {
        presenter.showError(viewController: self)
    }
    
    func dismissView() {
        dismiss(animated: true)
    }
}
