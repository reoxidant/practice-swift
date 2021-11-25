//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

import UIKit

enum URLExamples: String {
    case imageURL = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    case exampleOne = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    case exampleTwo = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
    case exampleThree = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
    case exampleFour = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    case exampleFive = "https://swiftbook.ru//wp-content/uploads/api/api_courses_capital"
    case postRequest = "https://jsonplaceholder.typicode.com/posts"
    case imageUrl = "https://swiftbook.ru/wp-content/uploads/sites/2/2018/08/notifications-course-with-background.png"
}

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
    case ourCourses2 = "Our Courses 2"
    case postRequestWithDictionary = "POST Request with Dictionary"
    case postRequestWithModel = "POST Request with Model"
    case alamofireGetRequest = "Alamofire GET"
    case alamofirePostRequest = "Alamofire POST"
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
        case .ourCourses2:
            performSegue(withIdentifier: "showCourses2", sender: nil)
        case .postRequestWithDictionary:
            postRequestWithDictionary()
        case .postRequestWithModel:
            postRequestWithModel()
        case .alamofireGetRequest:
            performSegue(withIdentifier: "alamofireGetRequest", sender: nil)
        case .alamofirePostRequest:
            performSegue(withIdentifier: "alamofirePostRequest", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier != "showImage" else { return }
        
        if let coursesVC = segue.destination as? CoursesTableViewController {
            switch segue.identifier {
            case "alamofireGetRequest":
                coursesVC.alamofireGetRequestPressed()
            case "alamofirePostRequest":
                coursesVC.alamofirePostRequestPressed()
            default:
                break
            }
            
        }
        
        if let myCourseVC = segue.destination as? MyCourseTableViewController {
            switch segue.identifier {
            case "showCourses":
                myCourseVC.fetchCourses()
            case "showCourses2":
                myCourseVC.fetchCourses()
            default:
                break
            }
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
        
        guard let url = URL(string: URLExamples.exampleOne.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            
            do {
                let course = try JSONDecoder().decode(MyCourse.self, from: data)
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
        guard let url = URL(string: URLExamples.exampleTwo.rawValue) else { return }
        
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
        guard let url = URL(string: URLExamples.exampleThree.rawValue) else { return }
        
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
        guard let url = URL(string: URLExamples.exampleFour.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            
            do {
                let course = try JSONDecoder().decode([MyCourse].self, from: data)
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
    
    func postRequestWithDictionary() {
        guard let url = URL(string: URLExamples.postRequest.rawValue) else { return }
        
        // MARK: Dictionary
        
        let course = [
            "name": "Test",
            "imageUrl": URLExamples.imageUrl.rawValue,
            "numberOfLessons": "10",
            "numberOfTests": "2"
        ]
        
        guard let data = try? JSONSerialization.data(withJSONObject: course, options: []) else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = data
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    self?.showAlert(with: "Error:", message: "\(error.localizedDescription)")
                }
                return
            }
            
            guard let data = data else { return }
            
            do {
                let courseData = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    self?.showAlert(with: "Success", message: "You can see the result in the Debug Area")
                    print(courseData)
                }
            } catch let error {
                DispatchQueue.main.async {
                    self?.showAlert(with: "Error: ", message: "\(error.localizedDescription)")
                }
            }
            
        }.resume()
        
    }
    
    func postRequestWithModel() {
        
        // MARK: Model
        
        guard let url = URL(string: URLExamples.postRequest.rawValue) else { return }
        
        let course = Course(name: "Test", imageUrl: URLExamples.imageURL.rawValue, numberOfLessons: "20", numberOfTests: "5")
        
        guard let data = try? JSONEncoder().encode(course) else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = data
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    self?.showAlert(with: "Error:", message: "\(error.localizedDescription)")
                }
                return
            }
            
            guard let data = data else { return }
            
            do {
                let postCourseData = try JSONDecoder().decode(Course.self, from: data)
                DispatchQueue.main.async {
                    self?.showAlert(with: "Success:", message: "You can see the result in the Debug Area")
                    print(postCourseData)
                }
            } catch let error {
                DispatchQueue.main.async {
                    self?.showAlert(with: "Error:", message: "\(error.localizedDescription)")
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

