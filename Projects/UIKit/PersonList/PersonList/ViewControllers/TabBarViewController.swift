//
//  TabBarViewController.swift
//  PersonList
//
//  Created by Виталий Шаповалов on 16.11.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private var persons = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()

        persons = PersonListDataManager.shared.persons
        setupViewControllers()
    }
    
    func setupViewControllers() {
        guard let personListViewController = viewControllers?.first as? PersonListViewController else { return }
        guard let detailPersonListViewController = viewControllers?.last as? DetailPersonListViewController else { return }
        
        personListViewController.persons = persons
        detailPersonListViewController.persons = persons
    }
}
