//
//  ViewController.swift
//  SpringApp
//
//  Created by Виталий Шаповалов on 21.11.2021.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var springAnimationLabel: SpringLabel!
    @IBOutlet weak var springButton: SpringButton!
    
    private var currentAnimation = Animation.getRandomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func springAnimationButtonPressed(_ sender: SpringButton) {
        
        animateButton(button: sender)
        
        animateLabel(label: springAnimationLabel)
        
        animateView(view: springAnimationView)
        
        setupNextAnimation()
    }
    
    private func animateButton(button: SpringButton) {
        button.animation = Spring.AnimationPreset.pop.rawValue
        button.curve = Spring.AnimationCurve.spring.rawValue
        button.duration = 1.0
        button.animate()
    }
    
    private func animateLabel(label: SpringLabel) {
        label.animation = Spring.AnimationPreset.zoomIn.rawValue
        label.curve = Spring.AnimationCurve.easeInOut.rawValue
        label.duration = 1.0
        label.delay = 0.3
        label.animate()
    }
    
    private func animateView(view: SpringView) {
        springAnimationLabel.text = currentAnimation.description
        
        view.animation = currentAnimation.animation
        view.curve = currentAnimation.curve
        view.force = currentAnimation.force
        view.duration = currentAnimation.duration
        view.delay = currentAnimation.delay
        view.animate()
    }
    
    
    private func setupNextAnimation() {
        currentAnimation = Animation.getRandomAnimation()
        springButton.setTitle("Run \(currentAnimation.animation)", for: .normal)
    }
}

