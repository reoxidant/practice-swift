//
//  CollectionViewCell.swift
//  CollectionViewInsideTableView
//
//  Created by Виталий Шаповалов on 03.02.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var colorView: UIView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
