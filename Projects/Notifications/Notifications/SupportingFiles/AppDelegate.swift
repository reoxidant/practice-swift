//
//  AppDelegate.swift
//  Notifications
//
//  Created by Виталий Шаповалов on 05.02.2022.
//

import UIKit
import Firebase
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let notifications = Notifications()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // MARK: Firebase
        
        FirebaseApp.configure()
        notifications.messagingDelegate.delegate = notifications
        
        // MARK: Default notification
        
        notifications.requestAuthorization()
        notifications.notificationCenter.delegate = notifications
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        print("Device token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("Failed to register: \(error)")
    }
}
