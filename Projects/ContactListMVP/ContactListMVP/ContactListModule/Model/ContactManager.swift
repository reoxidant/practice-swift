//
//  ContactManager.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 27.12.2021.
//

import Foundation

protocol ContactManagerProtocol {
    var contactsCount: Int { get }
    func getPerson(at index: Int) -> Person
    func add(person: Person)
}

class ContactManager: ContactManagerProtocol {
    
    private(set) var persons = [Person]()
    
    private init() {}
    
    static let shared = ContactManager()
    
    var contactsCount: Int {
        persons.count
    }
    
    func getPerson(at index: Int) -> Person {
        persons[index]
    }

    func add(person: Person) {
        if !persons.contains(where: { $0 == person }) {
            persons.append(person)
        }
    }
}
