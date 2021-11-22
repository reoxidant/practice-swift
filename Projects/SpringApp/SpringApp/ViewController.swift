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
    
    var randomAnimation: Spring.AnimationPreset.RawValue? {
        Spring.AnimationPreset.allCases.randomElement()?.rawValue
    }
    
    var randomCurve: Spring.AnimationCurve.RawValue? {
        Spring.AnimationCurve.allCases.randomElement()?.rawValue
    }
    
    var randomForceValue: CGFloat {
        CGFloat.random(in: 0...1)
    }
    
    var randomDurationValue: CGFloat {
        CGFloat.random(in: 0.7...3)
    }
    
    var randomDelayValue: CGFloat {
        CGFloat.random(in: 0...1)
    }
    
    var currentAnimationPresent: Spring.AnimationPreset.RawValue?
    var currentAnimationCurve: Spring.AnimationCurve.RawValue?
    var currentForceValue: CGFloat = 0
    var currentDurationValue: CGFloat = 0
    var currentDelayValue: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentAnimationPresent = randomAnimation
        currentAnimationCurve = randomCurve
        currentForceValue = randomForceValue
        currentDurationValue = randomDurationValue
        currentDelayValue = randomDelayValue
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
        guard let animation = currentAnimationPresent, let curve = currentAnimationCurve else { return }
        
        springAnimationLabel.text = """
                        present: \(animation)
                        curve: \(curve)
                        force: \(String(format: "%.1f", currentForceValue))
                        duration: \(String(format: "%.1f", currentDurationValue))
                        delay: \(String(format: "%.1f", currentDelayValue))
                        """
        
        view.animation = animation
        view.curve = curve
        view.force = currentForceValue
        view.duration = currentDurationValue
        view.delay = currentDelayValue
        view.animate()
    }
    
    
    private func setupNextAnimation() {
        currentAnimationPresent = randomAnimation
        currentAnimationCurve = randomCurve
        currentForceValue = randomForceValue
        currentDurationValue = randomDurationValue
        currentDelayValue = randomDelayValue
        
        let nextAnimationText = currentAnimationPresent ?? ""
        
        springButton.setTitle("Run \(nextAnimationText)", for: .normal)
    }
}

