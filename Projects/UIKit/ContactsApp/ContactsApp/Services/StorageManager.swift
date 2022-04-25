//
//  StorageManager.swift
//  ContactsApp
//
//  Created by Виталий Шаповалов on 28.11.2021.
//

import Foundation

struct StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "contacts"
    private var documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? nil
    private var archiveURL: URL?
    
    init() {
        archiveURL = documentURL?.appendingPathComponent("Contacts").appendingPathExtension("plist") ?? nil
    }
    
    //    func getContacts() -> [String] {
    //        guard let contacts = userDefaults.value(forKey: key) as? [String] else { return [] }
    //        return contacts
    //    }
    
    func getContacts() -> [Contact] {
        guard let data = userDefaults.value(forKey: key) as? Data else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func getFromFile() -> [Contact] {
        guard let url = archiveURL, let data = try? Data(contentsOf: url) else { return [] }
        guard let contacts = try? PropertyListDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    //    func save(contact: String) {
    //        var contacts = getContacts()
    //        contacts.append(contact)
    //        userDefaults.set(contacts, forKey: key)
    //    }
    
//    func save(contact: Contact) {
//        var contacts = getContacts()
//        contacts.append(contact)
//        guard let data = try? JSONEncoder().encode(contacts) else { return }
//        userDefaults.set(data, forKey: key)
//    }
    
    func save(contact: Contact) {
        var contacts = getContacts()
        contacts.append(contact)
        guard let data = try? PropertyListEncoder().encode(contacts), let url = archiveURL else { return }
        try? data.write(to: url, options: .noFileProtection)
    }
    
    //    func delete(at index: Int) {
    //        var contacts = getContacts()
    //        contacts.remove(at: index)
    //        userDefaults.set(contacts, forKey: key)
    //    }
    
//    func delete(at index: Int) {
//        var contacts = getContacts()
//        contacts.remove(at: index)
//        userDefaults.set(contacts, forKey: key)
//    }
    
    func delete(at index: Int) {
        var contacts = getContacts()
        contacts.remove(at: index)
        guard let data = try? PropertyListEncoder().encode(contacts), let url = archiveURL else { return }
        
        try? data.write(to: url, options: .noFileProtection)
    }
}
