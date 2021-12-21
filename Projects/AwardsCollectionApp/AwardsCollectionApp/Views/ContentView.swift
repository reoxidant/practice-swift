//
//  ContentView.swift
//  AwardsCollectionApp
//
//  Created by Виталий Шаповалов on 14.12.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showShape = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(showShape ? "Hide Shape" : "Show Shape")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(showShape ? 2 : 1)
                        .rotationEffect(.degrees(showShape ? 0 : 180))
                }
            }
            Spacer()
            
            if showShape {
                GradientRectangles(width: 250, height: 250)
                    .transition(.trasition)
            }
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            showShape.toggle()
        }
    }
}

extension AnyTransition {
    static var trasition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
