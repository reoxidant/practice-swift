//
//  ContactListTests.swift
//  ContactListTests
//
//  Created by Виталий Шаповалов on 22.12.2021.
//

import XCTest
@testable import ContactList

class ContactListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitialViewControllerIsContactListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers.first
        
        XCTAssertTrue(rootViewController is ContactListViewController)
    }
}
