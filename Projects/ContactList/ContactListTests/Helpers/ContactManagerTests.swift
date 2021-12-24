//
//  ContactManagerTests.swift
//  ContactListTests
//
//  Created by Виталий Шаповалов on 24.12.2021.
//

import XCTest
@testable import ContactList

class ContactManagerTests: XCTestCase {
    
    var contactManager: ContactManager!
    var person: Person!

    override func setUp() {
        super .setUp()
        contactManager = ContactManager()
        person = Person(name: "Foo", phone: "Bar")
    }

    override func tearDown() {
        contactManager = nil
        person = nil
        super.tearDown()
    }
    
    func testContactManagerContactsListIsEmpty() {
        XCTAssertEqual(contactManager.contactsCount, 0)
    }
    
    func testContactListIncreasedCount() {
        contactManager.add(person: person)
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
    
    func testContactIsAdded() {
        contactManager.add(person: person)
        
        let returnedPerson = contactManager.getPerson(at: 0)
        XCTAssertEqual(person, returnedPerson)
    }
    
    func testSamePersonIsNotAdded() {
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
}
