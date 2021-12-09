//
//  SliderColorView.swift
//  SliderColorsSwiftUI
//
//  Created by Виталий Шаповалов on 07.12.2021.
//

import SwiftUI

struct SliderColorView: View {
    
    let title: String
    let color: Color
    
    @Binding var currentValue: Double
    @State private var text: String = ""
    
    var body: some View {
        HStack(spacing: 20) {
            Text(title)
                .foregroundColor(.white)
                .frame(width: 60, alignment: .leading)
            Text(text)
                .foregroundColor(.white)
            Slider(value: $currentValue, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: currentValue) { newValue in
                    text = "\(lround(newValue))"
                }
            TextFieldColorView(text: $text, currentValue: $currentValue)
        }
        .onAppear {
            text = "\(lround(currentValue))"
        }
        .padding()
    }
}

struct SliderColorView_Previews: PreviewProvider {
    static var previews: some View {
        SliderColorView(title: "Red:", color: .red, currentValue: .constant(0))
    }
}
