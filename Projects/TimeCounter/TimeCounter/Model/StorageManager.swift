//
//  StorageManager.swift
//  TimeCounter
//
//  Created by Виталий Шаповалов on 09.12.2021.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let userKey = "user"
    
    private init() {}
    
    func save(user: User) {
        guard let data = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(data, forKey: userKey)
    }
    
    func fetchUser() -> User {
        guard let data = userDefaults.object(forKey: userKey) as? Data,
              let user = try? JSONDecoder().decode(User.self, from: data) else {
            return User()
        }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegister = false
        userManager.user.name = ""
        userDefaults.removeObject(forKey: userKey)
    }
}
