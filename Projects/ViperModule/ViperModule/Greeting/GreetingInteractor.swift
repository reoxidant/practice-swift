//
//  GreetingInteractor.swift
//  ViperModule
//
//  Created by Виталий Шаповалов on 03.01.2022.
//

protocol GreetingInteractorInputProtocol {
    init(presenter: GreetingInteractorOutputProtocol)
    func provideGreetingData()
}

protocol GreetingInteractorOutputProtocol: AnyObject {
    func receiveGreetingData(greetingData: GreetingData)
}

class GreetingInteractor: GreetingInteractorInputProtocol {
    
    weak var presenter: GreetingInteractorOutputProtocol?
    
    required init(presenter: GreetingInteractorOutputProtocol) {
        self.presenter = presenter
    }
                    
    func provideGreetingData() {
        let person = Person(name: "Tim", surname: "Cook")
        let greetingData = GreetingData(name: person.name, surname: person.surname)
        presenter?.receiveGreetingData(greetingData: greetingData)
    }
}
