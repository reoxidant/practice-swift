//
//  ContactListUITests.swift
//  ContactListUITests
//
//  Created by Виталий Шаповалов on 24.12.2021.
//

import XCTest

class ContactListUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        app.navigationBars["ContactList.ContactListView"].buttons["Add"].tap()
        app.textFields["Name"].tap()
        app.textFields["Name"].typeText("Foo")
        
        let surnameTextField = app.textFields["Surname"]
        surnameTextField.tap()
        surnameTextField.typeText("Bar")
        
        let phoneTextField = app.textFields["Phone"]
        phoneTextField.tap()
        phoneTextField.typeText("Baz")
        
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["Foo"].exists)
    }
}
