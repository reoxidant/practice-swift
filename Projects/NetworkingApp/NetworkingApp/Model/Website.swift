//
//  Website.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

struct Website: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}
