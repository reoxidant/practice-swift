//
//  Animate.swift
//  SpringApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

import Spring

struct Animation {
    
    let animation: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
    var description: String {
                        """
                        present: \(animation)
                        curve: \(curve)
                        force: \(String(format: "%.1f", force))
                        duration: \(String(format: "%.1f", duration))
                        delay: \(String(format: "%.1f", delay))
                        """
    }
    
    static func getRandomAnimation() -> Animation {
        
        let randomAnimation = Spring.AnimationPreset.allCases.randomElement()?.rawValue ?? Spring.AnimationPreset.slideLeft.rawValue
        
        let randomCurve = Spring.AnimationCurve.allCases.randomElement()?.rawValue ?? Spring.AnimationCurve.easeInOut.rawValue
        
        return Animation(
            animation: randomAnimation,
            curve: randomCurve,
            force: CGFloat.random(in: 0...1),
            duration: CGFloat.random(in: 0.7...3),
            delay: CGFloat.random(in: 0...1)
        )
    }
}
