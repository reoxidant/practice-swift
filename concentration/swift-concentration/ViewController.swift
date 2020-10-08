//
//  ViewController.swift
//  swift-concentration
//
//  Created by Виталий Шаповалов on 09.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelFlips: UILabel!
    
    @IBOutlet var cardCollection: [UIButton]!
    
    let arEmojies = ["💩", "👻", "🎃"]
    
    var countFlips = 0 {
        didSet{
            labelFlips.text = "Flips: \(countFlips)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        countFlips+=1
        let indexOfBtn = cardCollection.firstIndex(of: sender)!
        flipCard(setEmoji: arEmojies[indexOfBtn], andSetBgColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), on: sender)
    }
    
    func flipCard(setEmoji emoji: String, andSetBgColor color: UIColor, on button: UIButton){
        
        if(button.currentTitle == emoji){
            button.setTitle("", for: .normal)
            button.backgroundColor = color
        }else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
}

