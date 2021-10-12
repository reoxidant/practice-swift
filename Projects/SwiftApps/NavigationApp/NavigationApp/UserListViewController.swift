//
//  UserListViewController.swift
//  NavigationApp
//
//  Created by hutzo on 12.10.2021.
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var users = ["Rick", "Morty"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? UserDetailsViewController else { return }
        
        viewController.userName = sender as? String
    }
}
