//
//  CollectionViewCell.swift
//  UICollectionView
//
//  Created by Виталий Шаповалов on 31.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(name:String){
        self.nameLabel.text = name
    }
    
    override var isSelected: Bool {
        didSet{
            self.contentView.backgroundColor = isSelected ? .red : .clear
            self.nameLabel.textColor = isSelected ? .white : .black
            self.layer.borderColor = isSelected ? UIColor.clear.cgColor : UIColor.black.cgColor
        }
    }
}
