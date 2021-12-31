//
//  DetailPresenter.swift
//  ContactListMVP
//
//  Created by Виталий Шаповалов on 27.12.2021.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func configureView(person: Person)
}

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, person: Person)
    func setPerson()
}

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let person: Person
    
    required init(view: DetailViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func setPerson() {
        view?.configureView(person: person)
    }
}
