//
//  GreetingViewController.swift
//  ViperModule
//
//  Created by Виталий Шаповалов on 03.01.2022.
//

import UIKit

protocol GreetingViewInputProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol GreetingViewOutputProtocol {
    init(view: GreetingViewInputProtocol)
    func didTapShowGreetingPressed()
}

class GreetingViewController: UIViewController {
    
    @IBOutlet var greetingLabel: UILabel!
    var presenter: GreetingViewOutputProtocol!
    
    private let assembly: GreetingAssemblyInputProtocol = GreetingAssembly()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        assembly.assembly(view: self)
    }
    
    @IBAction func showGreetingPressed() {
        presenter.didTapShowGreetingPressed()
    }
}

extension GreetingViewController: GreetingViewInputProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
}

