//
//  SliderView.swift
//  GuessTheNumber
//
//  Created by Виталий Шаповалов on 10.12.2021.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var currentValue: Double
    let targetValue: Int
    let alpha: Int
    let color: UIColor
    
    var body: some View {
        Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
        HStack {
            Text("0")
            SliderViewRepresentable(value: $currentValue, alpha: alpha, color: color)
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(50.0), targetValue: 50, alpha: 1, color: .red)
    }
}
