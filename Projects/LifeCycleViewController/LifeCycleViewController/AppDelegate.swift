//
//  AppDelegate.swift
//  LifeCycleViewController
//
//  Created by Виталий Шаповалов on 16.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Загрузка приложения завершена
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // Вызывается перед переходом в состояние в фонового режим
    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
    }
    
    // Вызывается при перехода в фоновый режим
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
    }
    
    // Вызывается перед переходом на Передний план
    func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function)
    }
    
    // Вызывает при переходе на Передний план
    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
    }
    
    // Вызывается при завершении работы
    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
    }

    // MARK: UISceneSession Lifecycle

    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
