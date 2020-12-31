//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Виталий Шаповалов on 31.12.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.isHidden = true
        label.font = label.font.withSize(30)
        label.numberOfLines = 2
        label.textAlignment = .center
        
        segmentControl.insertSegment(withTitle: "Third", at: 2, animated: true)
    }

    
    @IBAction func choiseSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        
        let index = segmentControl.selectedSegmentIndex
        
        switch index
        {
            case 0:
                label.text = "Select the \(segmentControl.titleForSegment(at: index)!) segment!"
                label.textColor = .red
            case 1:
                label.text = "Select the \(segmentControl.titleForSegment(at: index)!) segment!"
                label.textColor = .blue
            case 2:
                label.text = "Select the \(segmentControl.titleForSegment(at: index)!) segment!"
                label.textColor = .cyan
            default:
                print("Something is wrong!")
        }
    }
}

