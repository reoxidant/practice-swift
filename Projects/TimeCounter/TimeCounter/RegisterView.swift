//
//  RegisterView.swift
//  TimeCounter
//
//  Created by Виталий Шаповалов on 09.12.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var userManager: UserManager

    var body: some View {
        VStack(spacing: 20) {
            RegisterTextFieldView(name: $userManager.user.name, nameIsValid: userManager.nameIsValid)
            Button(action: submitUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.nameIsValid)
        }
    }
    
    private func submitUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegister.toggle()
            //StorageManager.shared.save(user: userManager.user)
            AppStorageManager.shared.save(user: userManager.user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

struct RegisterTextFieldView: View {
    
    @Binding var name: String
    var nameIsValid: Bool
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $name)
                .disableAutocorrection(true)
                .multilineTextAlignment(.center)
                .frame(width: 200)
            Text("\(name.trimmingCharacters(in: .whitespaces).count)")
                .foregroundColor(nameIsValid ? .green : .red)
        }
    }
}
