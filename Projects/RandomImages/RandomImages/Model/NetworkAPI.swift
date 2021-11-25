//
//  NetworkAPI.swift
//  RandomImages
//
//  Created by Виталий Шаповалов on 25.11.2021.
//

import Foundation

enum NetworkAPI {
    case images
    
    var url: URL? { URL(string: "https://picsum.photos/200") }
}
