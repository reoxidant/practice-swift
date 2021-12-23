//
//  ContactListViewController.swift
//  ContactListTests
//
//  Created by Виталий Шаповалов on 23.12.2021.
//

import XCTest
@testable import ContactList

class ContactListViewControllerTests: XCTestCase {
    
    var sut: ContactListViewController!
    
    var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }.first
    }

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ContactListViewController") as? ContactListViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewIsLoadedAndTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testViewIsLoadedAndTableViewDataSourceNotNil() {
        XCTAssertNotNil(sut.dataSource)
    }
    
    func testViewIsLoadedAndTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is ContactListDataSource)
    }
    
    func testNewContactButtonIsAdded() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? ContactListViewController, sut)
    }
    
    func testNewContactViewControllerHasOpened() {
        let newContactVC = presentNewContactViewController()
        XCTAssertNotNil(newContactVC.nameTextField)
    }
    
    func testDataSourceAndNewContactWithSameContactManager() {
        let newContactVC = presentNewContactViewController()
        XCTAssertNotNil(sut.dataSource.contactManager)
        XCTAssertTrue(newContactVC.contactManager === sut.dataSource.contactManager)
    }
    
    func testTableViewReloadAfterViewAppeared() {
        let mockTableView = MockTableView()
        sut.tableView = mockTableView
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertTrue((sut.tableView as! MockTableView).isReloaded)
    }
    
    func testTappingCellSendNotification() {
        let imageData = UIImage(systemName: "person.fill")?.pngData()
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        sut.dataSource.contactManager?.add(person: person)
        
        expectation(forNotification: NSNotification.Name(rawValue: "DidSelectRow"), object: nil) { notification ->
            Bool in
            guard let personFromNotification = notification.userInfo?["person"] as? Person else { return false }
            return person == personFromNotification
        }
        
        let tableView = sut.tableView
        tableView?.delegate?.tableView?(tableView!, didSelectRowAt: IndexPath(row: 0, section: 0))
        waitForExpectations(timeout: 1)
    }
    
    func testSelectedCellHasShownDetailVC() {
        let mockNavigationController = MockNavigationController(rootViewController: sut)
        
        keyWindow?.rootViewController = mockNavigationController
        
        sut.loadViewIfNeeded()
        
        let imageData = UIImage(systemName: "person.fill")?.pngData()
        let personOne = Person(name: "Foo", phone: "Bar", imageData: imageData)
        let personTwo = Person(name: "Bar", phone: "Baz", imageData: imageData)
        
        sut.dataSource.contactManager?.add(person: personOne)
        sut.dataSource.contactManager?.add(person: personTwo)
        
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "DidSelectRow"), object: self, userInfo: ["person": personTwo]
        )
        
        guard let detailVC = mockNavigationController.pushedViewController as? DetailViewController
        else {
            XCTFail()
            return
        }
        
        detailVC.loadViewIfNeeded()

        XCTAssertNotNil(detailVC.nameLabel)
        XCTAssertTrue(detailVC.person == personTwo)
    }
}

extension ContactListViewControllerTests {
    
    func presentNewContactViewController() -> NewContactViewController {
        guard let addNewContactButton = sut.navigationItem.rightBarButtonItem,
              let action = addNewContactButton.action else {
            return NewContactViewController()
        }

        keyWindow?.rootViewController = sut
        sut.performSelector(onMainThread: action,
                            with: addNewContactButton,
                            waitUntilDone: true)
        
        let newContactVC = sut.presentedViewController as! NewContactViewController
        
        return newContactVC
    }
}

extension ContactListViewControllerTests {
    
    class MockTableView: UITableView {
        var isReloaded = false
        
        override func reloadData() {
            isReloaded = true
        }
    }
    
    class MockNavigationController: UINavigationController {
        var pushedViewController: UIViewController?
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
}
