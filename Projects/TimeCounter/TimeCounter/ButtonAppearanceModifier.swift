//
//  ButtonAppearanceModifier.swift
//  TimeCounter
//
//  Created by Виталий Шаповалов on 09.12.2021.
//

import SwiftUI

struct ButtonAppearanceModifier: ViewModifier {

    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 50)
            .frame(width: 200, height: 50)
            .background(color)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 4)
            )
    }
}

extension View {
    func buttonAppearance(_ color: Color) -> some View {
        ModifiedContent(content: self, modifier: ButtonAppearanceModifier(color: color))
    }
}
