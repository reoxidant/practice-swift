//
//  ProductListViewModel.swift
//  ProductListMVVM
//
//  Created by Виталий Шаповалов on 29.12.2021.
//

import Foundation

protocol ProductListViewModelProtocol: AnyObject {
    var products: [Product] { get }
    var productsCount: Int { get }
    func fetchProducts(completion: @escaping () -> Void)
    func getCellViewModel(at indexPath: IndexPath) -> ProductCellViewModelProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailProductViewModelProtocol
}

class ProductListViewModel: ProductListViewModelProtocol {
    
    var products: [Product] = []
    
    var productsCount: Int {
        products.count
    }
    
    func fetchProducts(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> ProductCellViewModelProtocol {
        let product = products[indexPath.row]
        return ProductCellViewModel(product: product)
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailProductViewModelProtocol {
        let product = products[indexPath.row]
        return DetailProductViewModel(product: product)
    }
}
