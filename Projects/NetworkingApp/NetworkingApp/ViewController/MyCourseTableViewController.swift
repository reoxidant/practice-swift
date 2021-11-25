//
//  MyCourseTableViewController.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 25.11.2021.
//

import UIKit

class MyCourseTableViewController: UITableViewController {
    
    var courses: [MyCourse] = []
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCourseTableViewCell.identifier, for: indexPath) as? MyCourseTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: courses[indexPath.row])
        
        return cell
    }
    
    func fetchCourses() {
        
        guard let url = URL(string: URLExamples.exampleFour.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            
            do {
                // MARK: Need to have the Int value for Courses
                self?.courses = try JSONDecoder().decode([MyCourse].self, from: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
