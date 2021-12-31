//
//  ContactListPresenter.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 26.12.2021.
//

import Foundation

protocol ContactListPresenterProtocol: AnyObject {
    init(manager: ContactManagerProtocol, router: RouterProtocol)
    func getPerson(at index: Int) -> Person
    func contactCount() -> Int
    func tappedToCell(person: Person)
    func tappedToAddNewContactButton()
}

class ContactListPresenter: ContactListPresenterProtocol {

    let router: RouterProtocol?
    let manager: ContactManagerProtocol
    
    required init(manager: ContactManagerProtocol, router: RouterProtocol) {
        self.manager = manager
        self.router = router
    }
    
    func tappedToCell(person: Person) {
        router?.showDetail(person: person)
    }
    
    func tappedToAddNewContactButton() {
        router?.addNewContact()
    }
    
    func getPerson(at index: Int) -> Person {
        manager.getPerson(at: index)
    }
    
    func contactCount() -> Int {
        manager.contactsCount
    }
}
