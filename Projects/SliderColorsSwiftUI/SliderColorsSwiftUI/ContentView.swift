//
//  ContentView.swift
//  SliderColorsSwiftUI
//
//  Created by Виталий Шаповалов on 07.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(red: 0 / 255, green: 76 / 255, blue: 157 / 255)
                .ignoresSafeArea()
            VStack {
                ColorView(redValue: redSliderValue,
                          greenValue: greenSliderValue,
                          blueValue: blueSliderValue)
                VStack{
                    SliderColorView(title:"Red:", color: .red, currentValue: $redSliderValue)
                    SliderColorView(title:"Green:", color: .green, currentValue: $greenSliderValue)
                    SliderColorView(title:"Blue:", color: .blue, currentValue: $blueSliderValue)
                }
                Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
