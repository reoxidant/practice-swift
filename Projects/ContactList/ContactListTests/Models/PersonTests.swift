//
//  PersonTests.swift
//  ContactListTests
//
//  Created by Виталий Шаповалов on 24.12.2021.
//

import XCTest
@testable import ContactList

class PersonTests: XCTestCase {

    var image: UIImage?
    var imageData: Data?
    
    override func setUp() {
        super.setUp()
        
        image = UIImage(systemName: "person")
        guard let image = image else {
            return
        }
        imageData = image.pngData()
    }

    override func tearDown() {
        image = nil
        imageData = nil
        super.tearDown()
    }
    
    func testInitPersonWithNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertNotNil(person)
    }

    func testInitPersonWithFullNameAndPhone() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        XCTAssertNotNil(person)
    }
    
    func testInitPersonWithDate() {
        let person = Person(name: "Foo", phone: "Baz")
        
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithFullNameAndDate() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithImage() {
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        
        XCTAssertNotNil(person.imageData)
    }
    
    func testInitPersonWithFullNameAndImage() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz", imageData: imageData)
        
        XCTAssertNotNil(person.imageData)
    }
    
    func testPersonSetNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        
        XCTAssertEqual(person.name, "Foo")
        XCTAssertEqual(person.phone, "Bar")
    }
    
    func testPersonSetFullNameAndPhone() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        
        XCTAssertTrue(person.surname == "Bar")
    }
}
