//
//  ButtonView.swift
//  GuessTheNumber
//
//  Created by Виталий Шаповалов on 10.12.2021.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var showingAlert: Bool
    
    let title: String
    let currentScore: Int
    let action: () -> Void
    
    var body: some View {
        Button(title){ action() }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Your score"), message: Text("\(currentScore)"), dismissButton: .default(Text("OK")))
            }
    }
    
    init(showingAlert: Binding<Bool> = .constant(false),
         title: String,
         currentScore: Int = 50,
         action: @escaping () -> Void = {}) {
        self._showingAlert = showingAlert
        self.title = title
        self.currentScore = currentScore
        self.action = action
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(showingAlert: .constant(false), title: "", currentScore: 0, action: {})
    }
}
