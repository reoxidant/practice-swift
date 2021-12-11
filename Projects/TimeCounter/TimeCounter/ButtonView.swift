//
//  ButtonView.swift
//  TimeCounter
//
//  Created by Виталий Шаповалов on 09.12.2021.
//

import SwiftUI

struct ButtonView: View {
    
    @EnvironmentObject var timer: TimeCounter
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonAppearance(color)
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "SomeTitle", color: .red, action: {})
    }
}
