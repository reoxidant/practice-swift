//
//  MyCourse.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 24.11.2021.
//

import Foundation

struct MyCourse: Codable {
    let name: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageUrl = "imageUrl"
        case numberOfLessons = "number_of_lessons"
        case numberOfTests = "number_of_tests"
    }
}
