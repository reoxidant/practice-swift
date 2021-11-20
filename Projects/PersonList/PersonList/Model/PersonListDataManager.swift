//
//  PersonListDataManager.swift
//  PersonListDataManager
//
//  Created by Виталий Шаповалов on 11.11.2021.
//

class PersonListDataManager {
    
    static let shared = PersonListDataManager()
    
    var persons = [Person]()
    
    private var names = ["Атомули", "Накосика", "Ятасука", "Мояхата", "Комухари", "Комуто", "Томимо", "Толисику", "Херанука", "Тояма", "Ясука", "Совсейдури", "Ручищито", "Стояна", "Лежана", "Вынька", "Бздашек", "Сри", "Мацал", "Мыкола"]
    
    private var surnames = ["Ядалато", "Сукасена", "Накомоде", "Сыровата", "Комусиси", "Херовато", "Токосо", "Толикаку", "Пороялю", "Токанава", "Такая", "Охерачу", "Ширехари", "Ракова", "Раздвиногова", "Мелоч", "Западловский", "Бестреску", "Кошек", "Заяицкий"]
    
    private var domains = ["@mail.ru", "@gmail.com", "@yandex.ru"]
    
    private var maxCountElements: Int {
        [names.count, surnames.count].max() ?? 0
    }
    
    private var emails = [String]()
    private var phoneNumbers = [Int]()
    
    init() {
        emails = createRandomEmailList(with: maxCountElements)
        phoneNumbers = createRandomPhoneNumberList(with: maxCountElements)
        generatePersons()
    }
    
    private func generatePersons() {
        let names = names.shuffled()
        let surnames = surnames.shuffled()
        let emails = emails.shuffled()
        let phoneNumbers = phoneNumbers.shuffled()
        
        for index in 0..<maxCountElements {
            let person = Person(name: names[index], surname: surnames[index], email: emails[index], phoneNumber: phoneNumbers[index])
            persons.append(person)
        }
    }
    
    private func createRandomEmailList(with count: Int) -> [String] {
        var emails = [String]()
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        while emails.count != count {
            let emailBody = String(repeating: characters.randomElement() ?? "j", count: 6)
            let randomDomain = domains.randomElement() ?? "@mail.ru"
            let newEmail = emailBody.appending(randomDomain)
            
            if !emails.contains(newEmail) {
                emails.append(newEmail)
            }
        }
        
        return emails
    }
    
    private func createRandomPhoneNumberList(with count: Int) -> [Int] {
        var phoneNumbers = [Int]()
        
        while phoneNumbers.count != maxCountElements {
            let phoneNumber = Int.random(in: 100000000 ... 999999999)
            
            if !phoneNumbers.contains(phoneNumber) {
                phoneNumbers.append(phoneNumber)
            }
        }
        
        return phoneNumbers
    }
}
