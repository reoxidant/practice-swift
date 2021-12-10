//
//  AppStorageManager.swift
//  TimeCounter
//
//  Created by Виталий Шаповалов on 09.12.2021.
//

import SwiftUI

class AppStorageManager {
    
    static let shared = AppStorageManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else {
            return User()
        }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegister = false
        userManager.user.name = ""
        userData = nil
    }
}
