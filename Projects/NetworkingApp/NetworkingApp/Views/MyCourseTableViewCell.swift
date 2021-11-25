//
//  MyCourseTableViewCell.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 25.11.2021.
//

import UIKit

class MyCourseTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseLessons: UILabel!
    @IBOutlet weak var courseTests: UILabel!
    
    static let identifier = "cell"
    
    func configure(with course: MyCourse) {
        
        courseName.text = course.name
        courseLessons.text = "Number of lessons: \(course.numberOfLessons ?? 0)"
        courseTests.text = "Number of tests: \(course.numberOfTests ?? 0)"
        
        DispatchQueue.global().async {
            
            guard
                let imageUrl = course.imageUrl,
                let url = URL(string: imageUrl),
                let imageData = try? Data(contentsOf: url)
            else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.courseImage.image = UIImage(data: imageData)
            }
        }
    }
}
