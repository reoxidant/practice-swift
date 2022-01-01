//
//  ProductCellViewModel.swift
//  ProductListMVVM
//
//  Created by Виталий Шаповалов on 30.12.2021.
//

import Foundation
import UIKit

protocol ProductCellViewModelProtocol: AnyObject {
    var title: String { get }
    var imageData: Data? { get }
    init(product: Product)
}

class ProductCellViewModel: ProductCellViewModelProtocol {

    private let product: Product
    
    var title: String {
        product.title
    }
    
    var imageData: Data? {
        try? Data(contentsOf: self.product.image)
    }
    
    required init(product: Product) {
        self.product = product
    }
}
