//
//  ContactCellTests.swift
//  ContactListTests
//
//  Created by Виталий Шаповалов on 24.12.2021.
//

import XCTest
@testable import ContactList

class ContactCellTests: XCTestCase {
    
    var cell: ContactTableViewCell!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ContactListViewController") as! ContactListViewController
        viewController.loadViewIfNeeded()
        
        let tableView = viewController.tableView
        let dataSource = MockTableViewDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: "cell", for: IndexPath(row: 0, section: 0)) as? ContactTableViewCell
        
    }

    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    
    func testNameLabelIsNotNil() {
        XCTAssertNotNil(cell.nameLabel)
    }
    
    func testNameLabelIsDescendant() {
        XCTAssertTrue(cell.nameLabel.isDescendant(of: cell.contentView))
    }
    
    func testCellConfigurated() {
        let person = Person(name: "Foo", phone: "Bar")
        cell.configure(with: person)
        XCTAssertEqual(cell.nameLabel.text, person.name)
    }
}

extension ContactCellTests {
    class MockTableViewDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
