//
//  SliderViewRepresentable.swift
//  GuessTheNumber
//
//  Created by Виталий Шаповалов on 10.12.2021.
//

import SwiftUI

struct SliderViewRepresentable: UIViewRepresentable {

    @Binding var value: Double
    let alpha: Int
    let color: UIColor
    
    // inititalized uikit view
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = color
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.tintColor = color
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    // updated view values from swiftui
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = Float(value)
    }
    
    // created coordinator to communicate with UIView
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderViewRepresentable {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        SliderViewRepresentable(value: .constant(100), alpha: 1, color: .red)
    }
}
