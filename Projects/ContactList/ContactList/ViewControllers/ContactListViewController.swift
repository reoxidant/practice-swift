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
        
        NotificationCenter.default.addObserver(self, selector: #selector(showDetail(withNotification:)),
                                         name: NSNotification.Name(rawValue: "DidSelectRow"), object: nil)
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
    
    @objc func showDetail(withNotification notification: Notification) {
        guard let userInfo = notification.userInfo,
              let person = userInfo["person"] as? Person,
              let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        else { fatalError() }
        
        detailVC.person = person
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

