//
//  GreetingAssembly.swift
//  ViperModule
//
//  Created by Виталий Шаповалов on 03.01.2022.
//

protocol GreetingAssemblyInputProtocol {
    func assembly(view: GreetingViewController)
}

class GreetingAssembly: GreetingAssemblyInputProtocol {
    func assembly(view: GreetingViewController) {
        let presenter = GreetingPresenter(view: view)
        let interactor = GreetingInteractor(presenter: presenter)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
