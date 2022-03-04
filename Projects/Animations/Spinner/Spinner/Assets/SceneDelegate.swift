//
//  SceneDelegate.swift
//  Spinner
//
//  Created by vshapovalov on 03.03.2022.
//  Copyright © 2022 Razeware LLC. All rights reserved.
//


import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: SpinnerView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
