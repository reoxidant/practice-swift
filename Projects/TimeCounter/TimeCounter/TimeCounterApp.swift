//
//  TimeCounterApp.swift
//  TimeCounter
//
//  Created by Виталий Шаповалов on 09.12.2021.
//

import SwiftUI

@main
struct TimeCounterApp: App {
    
    //@StateObject private var userManager = UserManager(user: StorageManager.shared.fetchUser())
    
//    private let user = StorageManager.shared.fetchUser()
    private let user = AppStorageManager.shared.fetchUser()
    
    var body: some Scene {
        WindowGroup {
            StartedView()
                .environmentObject(UserManager(user: user))
        }
    }
}
