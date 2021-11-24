//
//  Album.swift
//  HttpRequests
//
//  Created by Виталий Шаповалов on 23.11.2021.
//

import Foundation

struct Album: Codable {
    let title: String
    let url: String
    
    enum AlbumKeys: String, CodingKey {
        case title = "title"
        case url = "thumbnailUrl"
    }
}
