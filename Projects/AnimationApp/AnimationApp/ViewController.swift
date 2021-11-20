//
//  ViewController.swift
//  AnimationApp
//
//  Created by Виталий Шаповалов on 20.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coreAnimationView: UIView!
    
    var coreAnimationXPosition: CGFloat?
    
    override func viewWillLayoutSubviews() {
        coreAnimationXPosition = coreAnimationView.frame.origin.x
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.repeat, .autoreverse],
                       animations: { [unowned self] in
            if coreAnimationXPosition == coreAnimationView.frame.origin.x {
                coreAnimationView.frame.origin.x -= 20
            }
        })
    }
}

