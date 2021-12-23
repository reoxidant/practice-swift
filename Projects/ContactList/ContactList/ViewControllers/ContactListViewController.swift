//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Виталий Шаповалов on 22.12.2021.
//

import UIKit

class ContactListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataSource: ContactListDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        let contactManager = ContactManager()
        dataSource.contactManager = contactManager
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @IBAction func addNewContact(_ sender: UIBarButtonItem) {
        if let newContactVC = storyboard?.instantiateViewController(withIdentifier: "NewContactViewController") as? NewContactViewController {
            newContactVC.modalPresentationStyle = .fullScreen
            newContactVC.contactManager = dataSource.contactManager
            present(newContactVC, animated: true)
        }
    }
}

