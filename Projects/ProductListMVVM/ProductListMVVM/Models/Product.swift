//
//  Product.swift
//  ProductListMVVM
//
//  Created by Виталий Шаповалов on 29.12.2021.
//

import Foundation

struct Product: Decodable {
    let title: String
    let image: URL
    let description: String
    let category: String
    let price: Double
}
