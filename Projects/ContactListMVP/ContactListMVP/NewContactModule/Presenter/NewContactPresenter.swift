//
//  NewContactPresenter.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 27.12.2021.
//

import Foundation
import UIKit

protocol NewContactViewProtocol: AnyObject {
    func failure()
    func dismissView()
}

protocol NewContactPresenterProtocol: AnyObject {
    init(view: NewContactViewProtocol, manager: ContactManagerProtocol, router: RouterProtocol)
    func savePerson(person: Person)
    func popToRoot()
    func showError(viewController: UIViewController)
}

class NewContactPresenter: NewContactPresenterProtocol {

    weak var view: NewContactViewProtocol?
    let manager: ContactManagerProtocol
    let router: RouterProtocol
    
    required init(view: NewContactViewProtocol, manager: ContactManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.manager = manager
        self.router = router
    }
    
    func savePerson(person: Person) {
        if person.name.isEmpty || person.phone.isEmpty {
            view?.failure()
        } else {
            manager.add(person: person)
            view?.dismissView()
        }
    }
    
    func popToRoot() {
        router.popToRoot()
    }
    
    func showError(viewController: UIViewController) {
        router.alertInformation(viewController: viewController, title: "Error!", message: "Please fill your's name and phone number!")
    }
}
