//
//  ContactListMVPUITests.swift
//  ContactListMVPUITests
//
//  Created by Виталий Шаповалов on 28.12.2021.
//

import XCTest

class ContactListMVPUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        app.navigationBars["ContactListMVP.ContactListView"].buttons["Add"].tap()
        let nameTextField = app.textFields["Name"]
        nameTextField.tap()
        nameTextField.typeText("Foo")
        
        let surnameTextField = app.textFields["Surname"]
        surnameTextField.tap()
        surnameTextField.typeText("Bar")
        
        let phoneTextField = app.textFields["Phone"]
        phoneTextField.tap()
        phoneTextField.typeText("Baz")
        app.staticTexts["Save"].tap()
        
        XCTAssertTrue(app.staticTexts["Foo"].exists)
    }
}
