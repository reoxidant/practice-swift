//
//  Course.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

struct Course: Decodable {
    let name: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}
