//
//  GreetingPresenter.swift
//  ViperModule
//
//  Created by Виталий Шаповалов on 03.01.2022.
//

struct GreetingData {
    let name: String
    let surname: String
}

class GreetingPresenter: GreetingViewOutputProtocol {
    
    weak var view: GreetingViewInputProtocol?
    var interactor: GreetingInteractorInputProtocol!
     
    required init(view: GreetingViewInputProtocol) {
        self.view = view
    }
    
    func didTapShowGreetingPressed() {
        interactor.provideGreetingData()
    }
}

extension GreetingPresenter: GreetingInteractorOutputProtocol {
    func receiveGreetingData(greetingData: GreetingData) {
        let greeting = "Hello, \(greetingData.name) \(greetingData.surname)!"
        view?.setGreeting(greeting: greeting)
    }
}
