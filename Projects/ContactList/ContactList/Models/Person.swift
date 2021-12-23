//
//  Person.swift
//  ContactList
//
//  Created by Виталий Шаповалов on 23.12.2021.
//

import Foundation

struct Person {
    let name: String
    var surname: String?
    let phone: String
    var imageData: Data?
    
    init(name: String, phone: String, imageData: Data?) {
        self.name = name
        self.phone = phone
        self.imageData = imageData
    }
    
    init(name: String, surname: String, phone: String, imageData: Data? = nil) {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.imageData = imageData
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        lhs.phone == rhs.phone && lhs.name == rhs.name
    }
}
