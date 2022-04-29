//
//  User.swift
//  PersonApp
//
//  Created by hutzo on 14.10.2021.
//

import Foundation

struct User {
    let username: String
    let password: String
    let person: Person
}

func getUser() -> User {
    User(username: "User", password: "Password",
         person: Person(name: "Vitaliy", secondName: "Sokolov"))
}
