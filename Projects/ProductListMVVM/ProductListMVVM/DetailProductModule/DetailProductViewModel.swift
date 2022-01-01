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
    var isFavorite: Bool { get }
    var viewModelDidChange: ((DetailProductViewModelProtocol) -> Void)? { get set }
    init(product: Product)
    func didTapFavoriteButton()
}

class DetailProductViewModel: DetailProductViewModelProtocol {
    var isFavorite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(productTitle: product.title)
        }
        set {
            DataManager.shared.setFavoriteStatus(productTitle: product.title, status: newValue)
            viewModelDidChange?(self)
        }
    }
    
    var viewModelDidChange: ((DetailProductViewModelProtocol) -> Void)?
    
    func didTapFavoriteButton() {
        isFavorite.toggle()
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
    }
}
