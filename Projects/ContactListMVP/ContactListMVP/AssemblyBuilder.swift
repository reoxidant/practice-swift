//
//  Module.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 27.12.2021.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createContactListModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(person: Person, router: RouterProtocol) -> UIViewController
    func createNewContactModule(router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createContactListModule(router: RouterProtocol) -> UIViewController {
        let view = ContactListViewController()
        let manager = ContactManager.shared
        let presenter = ContactListPresenter(manager: manager, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(person: Person, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, person: person)
        view.presenter = presenter
        return view
    }
    
    func createNewContactModule(router: RouterProtocol) -> UIViewController {
        let view = NewContactViewController()
        let manager = ContactManager.shared
        let presenter = NewContactPresenter(view: view, manager: manager, router: router)
        view.presenter = presenter
        return view
    }
}
