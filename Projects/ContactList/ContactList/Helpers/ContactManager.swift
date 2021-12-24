//
//  ContactManager.swift
//  ContactList
//
//  Created by Виталий Шаповалов on 23.12.2021.
//

import Foundation

class ContactManager {
    
    private var persons = [Person]()
    
    var contactsCount: Int {
        persons.count
    }
    
    func add(person: Person) {
        if !persons.contains(where: { $0 == person }) {
            persons.append(person)
        }
    }
    
    func getPerson(at index: Int) -> Person {
        persons[index]
    }
}
