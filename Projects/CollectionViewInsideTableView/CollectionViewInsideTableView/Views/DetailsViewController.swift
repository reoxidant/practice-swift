//
//  DetailsViewController.swift
//  CollectionViewInsideTableView
//
//  Created by Виталий Шаповалов on 03.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let subCategory = UILabel()
    
    var backgroundColor: UIColor? {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
    
}
