//
//  ContactListDataSource.swift
//  ContactList
//
//  Created by Виталий Шаповалов on 23.12.2021.
//

import UIKit

class ContactListDataSource: NSObject {
    var contactManager: ContactManager?
}

extension ContactListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactManager?.contactsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        
        if let person = contactManager?.getPerson(at: indexPath.row) {
            cell.configure(with: person)
        }
        
        return cell
    }
}

extension ContactListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let person = contactManager?.getPerson(at: indexPath.row) else { return }
        
        NotificationCenter.default.post(
            name: NSNotification.Name("DidSelectRow"), object: self, userInfo: ["person": person]
        )
    }
}
