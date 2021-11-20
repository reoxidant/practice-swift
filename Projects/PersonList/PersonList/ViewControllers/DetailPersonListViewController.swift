//
//  DetailPersonListViewController.swift
//  PersonList
//
//  Created by Виталий Шаповалов on 11.11.2021.
//

import UIKit



class DetailPersonListViewController: UIViewController {
    
    enum PersonCell: String, CaseIterable {
        case phoneNumber = "phone"
        case email = "tray"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var persons = [Person]()
    
    private var currentPersonData = [PersonCell: String]()
}

extension DetailPersonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonCell.allCases.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personDetailCell", for: indexPath)
        
        let currentPerson = persons[indexPath.section]
        currentPersonData[.phoneNumber] = "\(currentPerson.phoneNumber)"
        currentPersonData[.email] = currentPerson.email
        
        cell.imageView?.image = UIImage(systemName: PersonCell.allCases[indexPath.row].rawValue)
        cell.textLabel?.text = currentPersonData[PersonCell.allCases[indexPath.row]]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }
}

extension DetailPersonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
