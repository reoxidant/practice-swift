//
//  SunView.swift
//  AwardsCollectionApp
//
//  Created by Виталий Шаповалов on 14.12.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct SunView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    private let colors = [Color.orange, Color.yellow, Color.green, Color.teal, Color.blue, Color.purple, Color.pink, Color.red]
    
    var body: some View {
        
        GeometryReader { geometry in
            
            let size = min(geometry.size.width, geometry.size.height)
            let petalLenght: CGFloat = size * 0.38
            let middle = size / 2
            let radius = size / 10
            let nearLine = middle - size * 0.1
            let farLine = middle + size * 0.1
        
            ForEach(0 ..< 8) { index in
                Path { path in
                    path.move(to: CGPoint(x: farLine, y: petalLenght))
                    path.addArc(center: CGPoint(x: middle, y: size * 0.25),
                                radius: radius,
                                startAngle: .degrees(360),
                                endAngle: .degrees(180),
                                clockwise: true)
                    path.addLine(to: CGPoint(x: nearLine, y: petalLenght))
                    path.addArc(center: CGPoint(x: middle, y: petalLenght),
                                radius: radius,
                                startAngle: .degrees(180),
                                endAngle: .degrees(360),
                                clockwise: true)
                }
                .fill(colors[index])
                .opacity(0.5)
                .rotationEffect(Angle(degrees: Double(index) * 45))
            }
        }
        .frame(width: width, height: height)
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView(width: 200, height: 200)
    }
}
