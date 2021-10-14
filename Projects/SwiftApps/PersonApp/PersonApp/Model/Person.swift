//
//  Person.swift
//  PersonApp
//
//  Created by hutzo on 14.10.2021.
//

import Foundation

struct Person {
    let name: String
    let secondName: String
    
    var fullname: String {
        "\(name) \(secondName)"
    }
}
