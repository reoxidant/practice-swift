//
//  SpinnerView.swift
//  Spinner
//
//  Created by vshapovalov on 03.03.2022.
//  Copyright © 2022 Razeware LLC. All rights reserved.
//

import SwiftUI

struct SpinnerView: View {
    
    @State var currentIndex: Int?
    
    struct Leaf: View {
        
        let rotation: Angle
        
        let isCurrent: Bool
        
        var body: some View {
            Capsule()
                .stroke(isCurrent ? Color.white: Color.gray, lineWidth: 8)
                .frame(width: 20, height: 50)
                .offset(x: 0, y: 70)
                .rotationEffect(rotation)
                .animation(.easeInOut(duration: 0.5))
        }
    }
    
    let leavesCount = 12
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0 ..< leavesCount) { index in
                    let degrees = (Double(index) / Double(self.leavesCount)) * 360
                    let isCurrent = index == self.currentIndex
                    
                    Leaf(rotation: Angle(degrees: degrees), isCurrent: isCurrent)
                }
            }
            .onAppear(perform: animate)
        }
    }
    
    func animate() {
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: { timer in
            if let current = currentIndex {
                self.currentIndex = (current + 1) % self.leavesCount
            } else {
                self.currentIndex = 0
            }
        })
    }
}

#if DEBUG
struct SpinnerView_Previews : PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
#endif
