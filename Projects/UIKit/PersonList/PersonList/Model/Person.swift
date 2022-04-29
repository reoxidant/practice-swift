//
//  Person.swift
//  PersonList
//
//  Created by Виталий Шаповалов on 11.11.2021.
//

struct Person {
    let name: String
    let surname: String
    let email: String
    let phoneNumber: Int
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
