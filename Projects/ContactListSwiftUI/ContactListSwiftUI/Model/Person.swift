//
//  Person.swift
//  ContactListSwiftUI
//
//  Created by Виталий Шаповалов on 13.12.2021.
//

struct Person {
    let id: Int
    let name: String
    let surname: String
    let email: String
    let phoneNumber: Int
    
    var fullName: String {
        name + " " + surname
    }
    
    static func generatePersons() -> [Person] {
        
        var persons = [Person]()
        
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let emails = DataManager.shared.emails
        let phoneNumbers = DataManager.shared.phoneNumbers
        
        for index in 0 ..< names.count {
            let person = Person(id: index, name: names[index], surname: surnames[index], email: emails[index], phoneNumber: phoneNumbers[index])
            persons.append(person)
        }
        
        return persons
    }
}
