//
//  ContactTableViewCell.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 27.12.2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    func configure(with person: Person) {
        textLabel?.text = person.name
    }
}
