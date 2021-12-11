//
//  TimerView.swift
//  TimeCounter
//
//  Created by Виталий Шаповалов on 09.12.2021.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var userManager: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack(spacing: 100) {
            Text("Hi, \(userManager.user.name)!")
                .fontWeight(.medium)
            Text("\(timer.count)")
            ButtonView(title: timer.buttonTitle, color: .red) {
                timer.startTimer()
            }
            
            ButtonView(title: "LogOut", color: .blue) {
                //StorageManager.shared.clear(userManager: userManager)
                AppStorageManager.shared.clear(userManager: userManager)
            }
            
        }
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(UserManager())
    }
}
