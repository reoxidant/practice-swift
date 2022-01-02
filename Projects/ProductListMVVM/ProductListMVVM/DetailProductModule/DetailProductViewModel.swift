//
//  DetailProductViewModel.swift
//  ProductListMVVM
//
//  Created by Виталий Шаповалов on 30.12.2021.
//

import Foundation

protocol DetailProductViewModelProtocol: AnyObject {
    var title: String { get }
    var imageData: Data? { get }
    var description: String { get }
    var category: String { get }
    var price: String { get }
    var isFavorite: Box<Bool> { get }
    init(product: Product)
    func didTapFavoriteButton()
}

class DetailProductViewModel: DetailProductViewModelProtocol {
    var isFavorite: Box<Bool>
    
    func didTapFavoriteButton() {
        isFavorite.value.toggle()
        DataManager.shared.setFavoriteStatus(productTitle: product.title, status: isFavorite.value)
    }
    
    private let product: Product
    
    var title: String {
        product.title
    }
    
    var imageData: Data? {
        try? Data(contentsOf: product.image)
    }
    
    var description: String {
        "Description: \(product.description)"
    }
    
    var category: String {
        "Category: \(product.category)"
    }
    
    var price: String {
        "Price: \(product.price)"
    }
    
    required init(product: Product) {
        self.product = product
        isFavorite = Box(value: DataManager.shared.getFavoriteStatus(productTitle: product.title))
    }
}
