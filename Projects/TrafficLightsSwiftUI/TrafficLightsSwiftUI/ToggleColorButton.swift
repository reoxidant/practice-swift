//
//  ToggleColorButton.swift
//  TrafficLightsSwiftUI
//
//  Created by Виталий Шаповалов on 07.12.2021.
//

import SwiftUI

struct ToggleColorButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 30)
        .padding()
        .background(Color(red: 12 / 255.0, green: 52 / 255.0, blue: 242 / 255.0))
        .cornerRadius(25)
        .overlay(RoundedRectangle(cornerRadius: 25).stroke(.white, lineWidth: 5))
    }
}

struct ToggleColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleColorButton(title: "start".uppercased(), action: {})
    }
}
