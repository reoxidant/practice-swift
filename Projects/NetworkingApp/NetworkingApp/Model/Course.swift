//
//  Course.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

struct Course: Codable {
    let name: String?
    let imageUrl: String?
    let numberOfLessons: String?
    let numberOfTests: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case imageUrl = "ImageUrl"
        case numberOfLessons = "Number_of_lessons"
        case numberOfTests = "Number_of_tests"
    }
    
    init(name: String, imageUrl: String, numberOfLessons: String, numberOfTests: String) {
        self.name = name
        self.imageUrl = imageUrl
        self.numberOfLessons = numberOfLessons
        self.numberOfTests = numberOfTests
    }
    
    init?(courseData: [String: Any]) {
        self.name = courseData["name"] as? String
        self.imageUrl = courseData["imageUrl"] as? String
        self.numberOfLessons = courseData["number_of_lessons"] as? String
        self.numberOfTests = courseData["number_of_tests"] as? String
    }
    
    static func getCourses(from value: Any) -> [Course]{
        guard let coursesData = value as? [[String: Any]] else { return [Course]() }
        return coursesData.compactMap({ Course(courseData: $0) })
    }
}
