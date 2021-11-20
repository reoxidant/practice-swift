//
//  PersonListViewController.swift
//  PersonList
//
//  Created by Виталий Шаповалов on 10.11.2021.
//

import UIKit

class PersonListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var persons = [Person]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow, let personVC = segue.destination as? PersonViewController {
            personVC.person = persons[indexPath.row]
        }
    }
}

extension PersonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = persons[indexPath.row]
        
        cell.textLabel?.text = person.fullName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension PersonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
