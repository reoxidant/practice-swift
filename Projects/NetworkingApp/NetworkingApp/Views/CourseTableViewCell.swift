//
//  CourseTableViewCell.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseLessons: UILabel!
    @IBOutlet weak var courseTests: UILabel!
    
    static let identifier = "cell"
    
    func configure(with course: Course) {
        
        print("title: \(course.name ?? "")")
        
        courseName.text = course.name
        courseLessons.text = "Number of lessons: \(course.number_of_lessons ?? 0)"
        courseTests.text = "Number of tests: \(course.number_of_tests ?? 0)"
        
        DispatchQueue.global().async {
        
            guard let imageUrl = course.imageUrl,
                  let url = URL(string: imageUrl),
                  let imageData = try? Data(contentsOf: url)
            else { return }
        
            print("load new image")
            
            print("image: \(imageUrl)")
     
            DispatchQueue.main.async { [weak self] in
                print("hello new image")
                
                self?.courseImage.image = UIImage(data: imageData)
            }
        }
    }
}
