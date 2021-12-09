//
//  ColorBackgroundView.swift
//  SliderColorsSwiftUI
//
//  Created by Виталий Шаповалов on 08.12.2021.
//

import SwiftUI

struct ColorView: View {
    
    let redValue: Double
    let greenValue: Double
    let blueValue: Double
    
    var body: some View {
        Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
            .frame(height: 200)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 5)
            )
            .padding()
    }
}

struct ColorBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redValue: 0.0, greenValue: 0.0, blueValue: 0.0)
    }
}
