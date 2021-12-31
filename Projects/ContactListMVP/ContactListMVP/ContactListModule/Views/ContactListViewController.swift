//
//  ContactListViewController.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 27.12.2021.
//

import UIKit

class ContactListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ContactListPresenterProtocol!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewContact))
    }
    
    @objc func addNewContact() {
        presenter.tappedToAddNewContactButton()
    }
}

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter.contactCount()
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContactTableViewCell {
            guard let person = presenter?.getPerson(at: indexPath.row) else { return cell }
            cell.configure(with: person)
            return cell
        }

        return UITableViewCell()
    }
}

extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let person = presenter?.getPerson(at: indexPath.row) else { return }
        presenter?.tappedToCell(person: person)
    }
}
