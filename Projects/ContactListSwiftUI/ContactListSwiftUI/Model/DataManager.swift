//
//  DataManager.swift
//  ContactListSwiftUI
//
//  Created by Виталий Шаповалов on 13.12.2021.
//

import Foundation


final class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    let names = ["Атомули", "Накосика", "Ятасука", "Мояхата", "Комухари", "Комуто", "Томимо", "Толисику", "Херанука", "Тояма", "Ясука", "Совсейдури", "Ручищито", "Стояна", "Лежана", "Вынька", "Бздашек", "Сри", "Мацал", "Мыкола"]
    
    let surnames = ["Ядалато", "Сукасена", "Накомоде", "Сыровата", "Комусиси", "Херовато", "Токосо", "Толикаку", "Пороялю", "Токанава", "Такая", "Охерачу", "Ширехари", "Ракова", "Раздвиногова", "Мелоч", "Западловский", "Бестреску", "Кошек", "Заяицкий"]
    
    let domains = ["@mail.ru", "@gmail.com", "@yandex.ru"]
    
    lazy var emails: [String] = {
        var emails = [String]()
        
        while emails.count != maxCount {
            let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let emailBody = String(repeating: characters.randomElement() ?? "j", count: 8)
            let email = emailBody.appending(domains.randomElement() ?? "@mail.ru")
            
            if !emails.contains(email) {
                emails.append(email)
            }
        }
        
        return emails
    }()
    
    lazy var phoneNumbers: [Int] = {
        var phoneNumbers = [Int]()
        
        while phoneNumbers.count != maxCount {
            let phoneNumber = Int.random(in: 100000000 ... 999999999)
            
            if !phoneNumbers.contains(phoneNumber) {
                phoneNumbers.append(phoneNumber)
            }
        }
        
        return phoneNumbers
    }()
    
    private var maxCount: Int {
        return max(names.count, surnames.count)
    }
}
