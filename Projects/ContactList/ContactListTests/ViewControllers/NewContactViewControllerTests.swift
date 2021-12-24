//
//  NewContactViewControllerTests.swift
//  ContactListTests
//
//  Created by Виталий Шаповалов on 24.12.2021.
//

import XCTest
@testable import ContactList

class NewContactViewControllerTests: XCTestCase {
    
    var newContactVC: NewContactViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        newContactVC = storyboard.instantiateViewController(withIdentifier: "NewContactViewController") as? NewContactViewController
        newContactVC.loadViewIfNeeded()
    }

    override func tearDown() {
        newContactVC = nil
        super.tearDown()
    }
    
    func testNameTextFieldIsDescendant() {
        XCTAssertTrue(newContactVC.nameTextField.isDescendant(of: newContactVC.view))
    }
    
    func testPhoneTextFieldIsDescendant() {
        XCTAssertTrue(newContactVC.phoneTextField.isDescendant(of: newContactVC.view))
    }
    
    func testSurnameTextFieldIsDescendant() {
        XCTAssertTrue(newContactVC.surnameTextField.isDescendant(of: newContactVC.view))
    }
    
    func testSaveButtonIsDescendant() {
        XCTAssertTrue(newContactVC.saveButton.isDescendant(of: newContactVC.view))
    }
    
    func testCancelButtonIsDescendant() {
        XCTAssertTrue(newContactVC.cancelButton.isDescendant(of: newContactVC.view))
    }
    
    func testSaveNewContact() {
        newContactVC.nameTextField.text = "Foo"
        newContactVC.surnameTextField.text = "Bar"
        newContactVC.phoneTextField.text = "Baz"
        
        newContactVC.contactManager = ContactManager()
        newContactVC.saveButtonPressed()
        
        let contact = newContactVC.contactManager.getPerson(at: 0)
        let imageData = UIImage(systemName: "person")?.pngData()
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz", imageData: imageData)
        
        XCTAssertEqual(contact, person)
    }
    
    func testSaveButtonCheckAction() {
        let saveButton = newContactVC.saveButton
        guard let actions = saveButton?.actions(forTarget: newContactVC, forControlEvent: .touchUpInside)
        else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(actions.contains("saveButtonPressed"))
    }
    
    func testSaveNewContactAndDismiss() {
        let mockContactVC = MockContactViewController()
        mockContactVC.nameTextField = UITextField()
        mockContactVC.nameTextField.text = "Foo"
        mockContactVC.surnameTextField = UITextField()
        mockContactVC.surnameTextField.text = "Bar"
        mockContactVC.phoneTextField = UITextField()
        mockContactVC.phoneTextField.text = "Baz"
        
        mockContactVC.contactManager = ContactManager()
        mockContactVC.saveButtonPressed()
        
        XCTAssertTrue(mockContactVC.isDismissed)
    }
}

extension NewContactViewControllerTests {
    class MockContactViewController: NewContactViewController {
        var isDismissed = false
        
        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            isDismissed = true
        }
    }
}
