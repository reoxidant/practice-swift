//
//  DetailViewControllerTests.swift
//  ContactListTests
//
//  Created by Виталий Шаповалов on 24.12.2021.
//

import XCTest
@testable import ContactList

class DetailViewControllerTests: XCTestCase {

    var detailVC: DetailViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        detailVC.loadViewIfNeeded()
    }

    override func tearDown() {
        detailVC = nil
        super.tearDown()
    }

    func testNameLabelIsDescendant() {
        XCTAssertNotNil(detailVC.nameLabel)
        XCTAssertTrue(detailVC.nameLabel.isDescendant(of: detailVC.view))
    }
    
    func testPhoneLabelIsDescendant() {
        XCTAssertNotNil(detailVC.phoneLabel)
        XCTAssertTrue(detailVC.phoneLabel.isDescendant(of: detailVC.view))
    }
    
    func testSurnameLabelIsDescendant() {
        XCTAssertNotNil(detailVC.surnameLabel)
        XCTAssertTrue(detailVC.surnameLabel.isDescendant(of: detailVC.view))
    }
    
    func testImageViewIIsDescendant() {
        XCTAssertNotNil(detailVC.imageView)
        XCTAssertTrue(detailVC.imageView.isDescendant(of: detailVC.view))
    }
    
    func testNameIsSetValue() {
        setupContactAndAppearanceTransition()
        XCTAssertEqual(detailVC.nameLabel.text, "Foo")
    }
    
    func testSurnameIsSetValue() {
        setupContactAndAppearanceTransition()
        XCTAssertEqual(detailVC.surnameLabel.text, "Bar")
    }
    
    func testPhoneLabelIsSetValue() {
        setupContactAndAppearanceTransition()
        XCTAssertEqual(detailVC.phoneLabel.text, "Baz")
    }
    
    func testImageViewIsSetValue() {
        setupContactAndAppearanceTransition()
        let imageData = UIImage(systemName: "person")?.pngData()
        XCTAssert(detailVC.person.imageData == imageData)
    }
    
    func testImageViewNotNill() {
        setupContactAndAppearanceTransition()
        XCTAssertNotNil(detailVC.imageView.image)
    }
}

extension DetailViewControllerTests {
    func setupContactAndAppearanceTransition() {
        let image = UIImage(systemName: "person")
        let imageData = image?.pngData()
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz", imageData: imageData)
        
        detailVC.person = person
        
        detailVC.beginAppearanceTransition(true, animated: true)
        detailVC.endAppearanceTransition()
    }
}
