//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

import UIKit

enum URLExample: String {
    case imageURL = "https://i.pinimg.com/474x/08/61/11/0861113734b40fc238dafd168ec2349b.jpg"
    case exampleOne = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    case exampleTwo = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
    case exampleThree = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
    case exampleFour = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
}

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
}

class CollectionViewController: UICollectionViewController {
    
    let userActions = UserActions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserViewCell.identifier, for: indexPath) as? UserViewCell else { return UICollectionViewCell() }
        
        cell.titleLabel.text = userActions[indexPath.row].rawValue
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = userActions[indexPath.row]
        
        switch action {
        case .downloadImage:
            performSegue(withIdentifier: "showImage", sender: nil)
        case .exampleOne:
            exampleOneCellPressed()
        case .exampleTwo:
            exampleTwoCellPressed()
        case .exampleThree:
            exampleThreeCellPressed()
        case .exampleFour:
            exampleFourCellPressed()
        case .ourCourses:
            performSegue(withIdentifier: "showCourses", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showCourses" else { return }
        
        if let coursesVC = segue.destination as? CoursesTableViewController {
            coursesVC.fetchCourses()
        }
    }
    
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension CollectionViewController {
    func exampleOneCellPressed() {
        
        guard let url = URL(string: URLExample.exampleOne.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            
            do {
                let course = try JSONDecoder().decode(Course.self, from: data)
                DispatchQueue.main.async {
                    self?.showAlert(with: "Success", message: "You can see the results in the Debug area")
                    print(course)
                }
            } catch let error {
                DispatchQueue.main.async {
                    self?.showAlert(with: "Failed", message: "\(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func exampleTwoCellPressed() {
        guard let url = URL(string: URLExample.exampleTwo.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            
            do {
                let course = try JSONDecoder().decode(Website.self, from: data)
                DispatchQueue.main.async {
                    self?.showAlert(with: "Success", message: "You can see the results in the Debug area")
                    print(course)
                }
            } catch let error {
                DispatchQueue.main.async {
                    self?.showAlert(with: "Failed", message: "\(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func exampleThreeCellPressed() {
        guard let url = URL(string: URLExample.exampleThree.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            
            do {
                let course = try JSONDecoder().decode(Website.self, from: data)
                DispatchQueue.main.async {
                    self?.showAlert(with: "Success", message: "You can see the results in the Debug area")
                    print(course)
                }
            } catch let error {
                DispatchQueue.main.async {
                    self?.showAlert(with: "Failed", message: "\(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func exampleFourCellPressed() {
        guard let url = URL(string: URLExample.exampleFour.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            
            do {
                let course = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.showAlert(with: "Success", message: "You can see the results in the Debug area")
                    print(course)
                }
            } catch let error {
                DispatchQueue.main.async {
                    self?.showAlert(with: "Failed", message: "\(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 36, height: 100)
    }
}

