//
//  ContactListPresenter.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 26.12.2021.
//

import Foundation

protocol ContactListViewProtocol: AnyObject {
    func showNewContacts()
}

protocol ContactListPresenterProtocol: AnyObject {
    init(manager: ContactManager)
    func getPerson(at index: Int) -> Person
    func contactCount() -> Int
}

class ContactListPresenter: ContactListPresenterProtocol {
    
    weak var view: ContactListViewProtocol!
    let manager: ContactManager
    
    required init(manager: ContactManager) {
        self.manager = manager
    }
    
    func getPerson(at index: Int) -> Person {
        manager.getPerson(at: index)
    }
    
    func contactCount() -> Int {
        manager.contactsCount
    }
}
