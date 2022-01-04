//
//  ContactListPresenterTests.swift
//  ContactListPresenterTests
//
//  Created by Виталий Шаповалов on 28.12.2021.
//

import XCTest
@testable import ContactListMVP

class MockView: ContactListViewProtocol {
    func showNewContacts() {
        
    }
}

class MockContactManager: ContactManagerProtocol {
    
    var persons: [Person]!
    
    var contactsCount: Int {
        persons.count
    }
    
    init(persons: [Person]) {
        self.persons = persons
    }
    
    func getPerson(at index: Int) -> Person {
        persons[index]
    }
    
    func add(person: Person) {
        persons.append(person)
    }
}

class ContactListPresenterTests: XCTestCase {
    
    var view: MockView!
    var presenter: ContactListPresenter!
    var contactManager: MockContactManager!
    var router: RouterProtocol!
    var persons = [Person]()

    override func setUp() {

    }

    override func tearDown() {
        view = nil
        presenter = nil
        contactManager = nil
    }
    
    func testContactManagerAddedNewPerson() {
        let imageData = UIImage(systemName: "person")?.pngData()
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        persons.append(person)

        let contactManager = MockContactManager(persons: persons)
        XCTAssertNotEqual(contactManager.contactsCount, 0)
        XCTAssertEqual(contactManager.contactsCount, persons.count)
    }
    
    func testContactManagerGetPerson() {
        let imageData = UIImage(systemName: "person")?.pngData()
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        persons.append(person)

        let contactManager = MockContactManager(persons: persons)
        XCTAssertNotNil(contactManager.getPerson(at: 0))
        XCTAssertEqual(contactManager.getPerson(at: 0), person)
    }
}
