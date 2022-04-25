//
//  Contact.swift
//  ContactsApp
//
//  Created by Виталий Шаповалов on 28.11.2021.
//

import Foundation

struct Contact: Codable {
    let name: String
    let surname: String
    
    var fullName: String {
        name + " " + surname
    }
}
