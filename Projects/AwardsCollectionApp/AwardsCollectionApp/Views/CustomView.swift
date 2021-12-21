//
//  CustomView.swift
//  AwardsCollectionApp
//
//  Created by Виталий Шаповалов on 14.12.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct CustomView: View {
    
    @State private var showShape = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                VStack {
                    Image(systemName: "chevron.up.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showShape ? 180 : 0))
                        .scaleEffect(showShape ? 2.5 : 2)
                        .padding()
                        .animation(.easeInOut, value: showShape)
                    
                    if showShape {
                        Text("Hide Shape")
                            .transition(.moveAndFaceText)
                    }
                }
            }
            
            Spacer()

            if showShape {
                SunView(width: 250, height: 250)
                    .transition(.moveAndFade)
            }
            
            Spacer()
        }
        .padding()
        .font(.headline)
    }
    
    private func buttonAction() {
        withAnimation {
            showShape.toggle()
        }
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        //        AnyTransition.move(edge: .leading)
        .asymmetric(
            insertion: .move(edge: .leading).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
    static var moveAndFaceText: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .top).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
