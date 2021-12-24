//
//  ContactTableViewCell.swift
//  ContactList
//
//  Created by Виталий Шаповалов on 24.12.2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    
    func configure(with person: Person) {
        nameLabel.text = person.name
    }
}
