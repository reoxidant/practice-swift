//
//  MainViewController.swift
//  SliderColors
//
//  Created by Виталий Шаповалов on 20.10.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else { return }
        
        colorVC.delegate = self
    }
}

extension MainViewController: ColorViewControllerDelegate {
    var currentColor: UIColor {
        view.backgroundColor ?? UIColor()
    }
    
    func applyNewColor(color: UIColor) {
        view.backgroundColor = color
    }
}
