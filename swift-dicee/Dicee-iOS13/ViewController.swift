//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var numberOfDice = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diceImageView1.image = #imageLiteral(resourceName: "DiceOne")
        diceImageView2.image = #imageLiteral(resourceName: "DiceSix")
    }
    
    
    @IBAction func rollBtn(_ sender: Any) {
        
        diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")][numberOfDice];
        
        diceImageView2.image = [#imageLiteral(resourceName: "DiceSix"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceOne"),][numberOfDice];
        
         numberOfDice = numberOfDice + 1;
        
    }
    
}

