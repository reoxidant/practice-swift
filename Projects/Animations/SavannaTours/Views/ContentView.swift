//
//  ContentView.swift
//  SavannaTours
//
//  Created by vshapovalov on 26.02.2022.
//  Copyright © 2022 Razeware LLC. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var zoomed = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeroImage(name: "hero")
            
            ZStack {
                HStack {
                    TourTitle(title: "Savanna Trek", caption: "15 mile drive followed by an hour long trek")
                        .offset(x: 0, y: -15)
                        .padding(.leading, 30)
                    
                    Spacer()
                }
                
                Image("thumb")
                    .position(x: self.zoomed ? 220 : 600, y: 50)
                    .scaleEffect(self.zoomed ? 1.33 : 0.33)
                    .shadow(radius: 10)
                    .animation(.spring())
                    .onTapGesture {
                        self.zoomed.toggle()
                    }
            }
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
            
            MilestonesList()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
