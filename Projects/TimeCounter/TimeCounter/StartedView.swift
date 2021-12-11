//
//  StartedView.swift
//  TimeCounter
//
//  Created by Виталий Шаповалов on 09.12.2021.
//

import SwiftUI

struct StartedView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.user.isRegister {
                TimerView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StartedView_Previews: PreviewProvider {
    static var previews: some View {
        StartedView()
            .environmentObject(UserManager())
    }
}
