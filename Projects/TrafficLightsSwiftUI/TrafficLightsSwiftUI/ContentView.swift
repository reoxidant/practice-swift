//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Виталий Шаповалов on 06.12.2021.
//

import SwiftUI

enum LightView {
    case red
    case yellow
    case green
}

struct ContentView: View {
    
    @State private var buttonTitle = "start".uppercased()
    @State private var currentLightView: LightView? = nil
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 30) {
                    ColorCircle(color: .red, opacity: currentLightView == .red ? 1 : 0.3)
                    ColorCircle(color: .yellow, opacity: currentLightView == .yellow ? 1 : 0.3)
                    ColorCircle(color: .green, opacity: currentLightView == .green ? 1 : 0.3)
                }
                Spacer()
                ToggleColorButton(title: buttonTitle, action: {
                    if buttonTitle == "START" {
                        currentLightView = .red
                        buttonTitle = "NEXT"
                    } else {
                        toggleTrafficLights()
                    }
                })
            }
        }
    }
    
    private func toggleTrafficLights() {
        
        switch currentLightView {
        case .red:  currentLightView = .yellow
        case .yellow: currentLightView = .green
        case .green: currentLightView = .red
        case .none:
            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

