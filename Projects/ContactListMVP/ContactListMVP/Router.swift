//
//  Router.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 28.12.2021.
//

import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func initialViewController()
    func showDetail(person: Person)
    func addNewContact()
    func popToRoot()
    func alertInformation(viewController: UIViewController, title: String, message: String)
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let contactListVC = assemblyBuilder?.createContactListModule(router: self) else { return }
            navigationController.viewControllers = [contactListVC]
        }
    }
    
    func showDetail(person: Person) {
        if let navigationController = navigationController {
            guard let detailVC = assemblyBuilder?.createDetailModule(person: person, router: self) else { return }
            navigationController.pushViewController(detailVC, animated: true)
        }
    }
    
    func addNewContact() {
        if let navigationController = navigationController {
            guard let newContactVC = assemblyBuilder?.createNewContactModule(router: self) else { return }
            newContactVC.modalPresentationStyle = .fullScreen
            navigationController.present(newContactVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    func alertInformation(viewController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        viewController.present(alertController, animated: true)
    }
}
