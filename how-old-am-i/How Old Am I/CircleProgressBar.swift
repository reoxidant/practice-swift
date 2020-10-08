//
//  CirclerogressBar.swift
//  How Old Am I
//
//  Created by Виталий Шаповалов on 08.08.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CircleProgressBar: UIView {
    
    private let circleMainBGLayer = CAShapeLayer();
    
    public var lineWidth:CGFloat = 7
    
    private var centerViewPath: CGPoint{
        get{
            return self.convert(self.center, from:self.superview)
        }
    }
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    
    private func addGradientLayer(path: UIBezierPath) {
        let gradientMask = CAShapeLayer()
        gradientMask.strokeColor = UIColor.red.cgColor
        gradientMask.path = path.cgPath

        let gradientLayer = CAGradientLayer()
        gradientLayer.mask = gradientMask
        gradientLayer.frame = layer.frame
        gradientLayer.contentsScale = UIScreen.main.scale
        gradientLayer.colors = [UIColor.gray.cgColor, UIColor.green.cgColor]
        self.layer.addSublayer(gradientLayer)
    }
    

    private func drawCirclePath(){
        self.layer.sublayers = nil
        let startAngle: CGFloat = 0
        let endAngle = CGFloat.pi * 2
        
        let bgCirclePath = UIBezierPath(arcCenter: centerViewPath, radius: 55.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        circleMainBGLayer.path = bgCirclePath.cgPath
        circleMainBGLayer.fillColor = UIColor.white.cgColor
        circleMainBGLayer.lineWidth = lineWidth
        circleMainBGLayer.strokeColor = UIColor.red.cgColor
        circleMainBGLayer.strokeEnd = 0
    
        self.layer.addSublayer(circleMainBGLayer)
    }
    
    
    private func startAnimation(){
        animation.toValue = 1
        animation.duration = 3
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        circleMainBGLayer.add(animation, forKey: "progressBarAnimation")
    }
    
    private func stopAnimation(){
        circleMainBGLayer.removeAllAnimations();
    }
    
    public func handlerButtonOnPress(){
        startAnimation();
    }
    
    public func handlerButtonUp(){
        stopAnimation()
    }
    
    public func drawCircleProgressBar(){
        drawCirclePath()
    }
}
