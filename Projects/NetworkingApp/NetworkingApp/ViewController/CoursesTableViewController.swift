//
//  CoursesTableViewController.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

import UIKit
import Alamofire

class CoursesTableViewController: UITableViewController {
    
    var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseTableViewCell.identifier, for: indexPath) as? CourseTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: courses[indexPath.row])
        
        return cell
    }
    
    func alamofireGetRequestPressed() {
        //        AF.request(URLExample.exampleFour.rawValue).responseJSON { dataResponse in
        //            guard let statusCode = dataResponse.response?.statusCode else { return }
        //            print("status code: \(statusCode)")
        //
        //            if (200..<300).contains(statusCode) {
        //                guard let value = dataResponse.value else { return }
        //                print("Value: \(value)")
        //            } else {
        //                guard let error = dataResponse.error else { return }
        //                print("Error: \(error)")
        //            }
        //        }
        
        AF.request(URLExamples.exampleFour.rawValue).validate().responseJSON { [weak self] dataResponse in
            switch dataResponse.result {
            case .success(let value):
                self?.courses = Course.getCourses(from: value)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func alamofirePostRequestPressed() {
        let course = [
            "Name": "Test",
            "ImageUrl": URLExamples.imageUrl.rawValue,
            "Number_of_lessons": "10",
            "Number_of_tests": "2"
        ]
        
        AF.request(URLExamples.postRequest.rawValue, method: .post, parameters: course).validate().responseDecodable(of: Course.self) { dataResponse in
            switch dataResponse.result {
            case .success(let course):
                self.courses.append(course)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
