//
//  ProductTableViewCell.swift
//  ProductListMVVM
//
//  Created by Виталий Шаповалов on 30.12.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    var viewModel: ProductCellViewModelProtocol! {
        didSet {
            DispatchQueue.global(qos: .utility).async {
                if let data = self.viewModel.imageData {
                    DispatchQueue.main.async {
                        var content = self.defaultContentConfiguration()
                        content.text = self.viewModel.title
                        content.image = UIImage(data: data)
                        self.contentConfiguration = content
                    }
                }
            }
        }
    }
    
    override func prepareForReuse() {
        contentConfiguration = nil
    }
}
