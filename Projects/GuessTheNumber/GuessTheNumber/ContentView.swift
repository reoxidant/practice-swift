//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Виталий Шаповалов on 10.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = Double.random(in: 0...100.0)
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 40) {
            SliderView(currentValue: $currentValue,
                       targetValue: targetValue,
                       alpha: computeScore(),
                       color: .red)
            
            ButtonView(showingAlert: $showingAlert,
                       title: "Проверь меня!",
                       currentScore: computeScore(),
                       action: { showingAlert = true }
            )
            
            ButtonView(title: "Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
