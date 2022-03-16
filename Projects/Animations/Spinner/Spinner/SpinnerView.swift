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
    @State var completed = false
    @State var isVisible = true
    @State var currentOffset = CGSize.zero
    
    let shootUp = AnyTransition.offset(CGSize(width: 0, height: -1000))
        .animation(.easeIn(duration: 1))
    
    struct Leaf: View {
        
        let rotation: Angle
        let isCurrent: Bool
        let isCompleting: Bool
        
        
        var body: some View {
            Capsule()
                .stroke(isCurrent ? Color.white: Color.gray, lineWidth: 8)
                .frame(width: 20, height: isCompleting ? 20 : 50)
                .offset(x: isCurrent ? 10 : 0, y: isCurrent ? 40 : 70)
                .scaleEffect(isCurrent ? 0.5 : 1)
                .rotationEffect(isCompleting ? .zero : rotation)
                .animation(.easeInOut(duration: 1.5))
        }
    }
    
    let leavesCount = 12
    
    var body: some View {
        VStack {
            if isVisible {
                ZStack {
                    ForEach(0 ..< leavesCount) { index in
                        let degrees = (Double(index) / Double(leavesCount)) * 360
                        let isCurrent = index == currentIndex
                        
                        Leaf(rotation: Angle(degrees: degrees),
                             isCurrent: isCurrent,
                             isCompleting: completed
                        )
                    }
                }
                .onAppear(perform: animate)
                .transition(shootUp)
                .gesture(
                    DragGesture()
                        .onChanged{ gesture in
                            currentOffset = gesture.translation
                        }
                        .onEnded { gesture in
                            if currentOffset.height > 150 {
                                complete()
                            }
                            currentOffset = .zero
                        }
                )
                .offset(currentOffset)
                .blur(radius: currentOffset == .zero ? 0 : 10)
                .animation(.easeInOut(duration: 1))
            }
        }
    }
    
    func animate() {
        
        var iteration = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: { timer in
            if let current = currentIndex {
                self.currentIndex = (current + 1) % self.leavesCount
            } else {
                self.currentIndex = 0
            }
            
            iteration += 1
            
            if iteration == 60 {
                timer.invalidate()
                self.complete()
            }
        })
    }
    
    func complete() {
        guard !completed else { return }
        
        completed = true
        currentIndex = nil
        delay(seconds: 2) {
            self.isVisible = false
        }
    }
}

#if DEBUG
struct SpinnerView_Previews : PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
#endif
