//
//  ViewController.swift
//  ContactsApp
//
//  Created by Виталий Шаповалов on 28.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var contacts = [Contact]()
    
    //    private var contacts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        contacts = StorageManager.shared.getContacts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newContactVC = segue.destination as? NewContactViewController {
            newContactVC.delegate = self
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.fullName
        
        //        let fullName = contacts[indexPath.row]
        //        cell.textLabel?.text = fullName
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            // tableView.reloadRows(at: [indexPath], with: .automatic)
            StorageManager.shared.delete(at: indexPath.row)
        }
    }
    
}

extension ViewController: NewContactDelegate {
    //    func saveContact(_ contact: String) {
    //        contacts.append(contact)
    //        tableView.reloadData()
    //    }
    
    func saveContact(_ contant: Contact) {
        contacts.append(contant)
        tableView.reloadData()
    }
}

